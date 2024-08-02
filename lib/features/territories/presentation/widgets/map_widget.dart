import 'package:field_companion/features/core/map_utils.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:permission_handler/permission_handler.dart';
import 'package:turf/along.dart';
import 'package:turf/helpers.dart';
import 'package:turf/turf.dart' as turf;

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({super.key});

  @override
  ConsumerState createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  late final mapbox.MapboxMap _map;

  @override
  void initState() {
    super.initState();
    Permission.locationWhenInUse.request();
  }

  Future<void> _onMapCreated(mapbox.MapboxMap map) async {
    final selectedTerritory = ref.read(selectedTerritoryProvider);
    final territories = ref.read(territoriesProvider);
    final mergedTerritories = territoriesToGeoJSON(territories);

    _map = map;

    await _map.logo.updateSettings(mapbox.LogoSettings(enabled: false));
    await _map.compass.updateSettings(mapbox.CompassSettings(enabled: false));
    await _map.scaleBar.updateSettings(mapbox.ScaleBarSettings(enabled: false));
    await _map.attribution.updateSettings(
      mapbox.AttributionSettings(enabled: false),
    );

    await map.style.addSource(
      mapbox.GeoJsonSource(id: "territories", data: mergedTerritories),
    );

    await _map.style.addLayer(
      mapbox.SymbolLayer(
        id: "territory-labels",
        sourceId: "territories",
        textField: "{label}",
        textSize: 14,
        textColor: const Color.fromARGB(255, 0, 104, 189).value,
      ),
    );

    await map.style.addLayer(
      mapbox.FillLayer(
        id: "territories-draw-layer",
        sourceId: "territories",
        fillColor: const Color.fromARGB(255, 0, 104, 189).value,
        fillOpacity: 0.3,
      ),
    );

    await _map.location.updateSettings(
      mapbox.LocationComponentSettings(
        enabled: true,
        showAccuracyRing: true,
        puckBearingEnabled: true,
      ),
    );

    // don´t remove this delay because of race condition
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _focusOnTerritory(selectedTerritory);
  }

  void _focusOnTerritory(Territory? territory) {
    mapbox.CameraOptions options;

    if (territory != null) {
      options = _centerOfTerritory(territory);
      _map.flyTo(options, mapbox.MapAnimationOptions(duration: 1000));
    }
  }

  mapbox.CameraOptions _centerOfTerritory(Territory? territory) {
    final obj = GeoJSONObject.fromJson(territory!.geoJson);
    final point = turf.center(obj).geometry;

    return mapbox.CameraOptions(
      center: mapbox.Point(
        coordinates: mapbox.Position(
          point?.coordinates.lng ?? 0,
          point?.coordinates.lat ?? 0,
        ),
      ),
      zoom: 16,
    );
  }

  mapbox.CameraOptions _cameraOptionsForAllTerritories() {
    final territories = ref.read(territoriesProvider);

    final List<mapbox.Feature> mergedFeatures = [];

    for (final territory in territories) {
      final features = FeatureCollection.fromJson(territory.geoJson).features;
      mergedFeatures.addAll(features);
    }

    final merged = mapbox.FeatureCollection(features: mergedFeatures);

    final Point? point = turf.center(merged).geometry;

    return mapbox.CameraOptions(
      center: mapbox.Point(
        coordinates: mapbox.Position(
          point?.coordinates.lng ?? 0,
          point?.coordinates.lat ?? 0,
        ),
      ),
      zoom: 13,
    );
  }

  Future<void> _onTapListener(mapbox.MapContentGestureContext context) async {
    final territories = ref.read(territoriesProvider);

    for (final territory in territories) {
      final contains = turf.booleanPointInPolygon(
        Position(context.point.coordinates.lng, context.point.coordinates.lat),
        FeatureCollection.fromJson(territory.geoJson).features.first,
      );

      if (contains) {
        ref.read(selectedTerritoryProvider.notifier).set(territory);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const accKey = "8a0d25a8-3989-4508-9a15-eb9b6366b3fb";
    const key = "JAC0nmE7iwuArAWW6eTi";

    ref.listen<Territory?>(
      selectedTerritoryProvider,
      (prev, current) => _focusOnTerritory(current),
    );

    return mapbox.MapWidget(
      onMapCreated: _onMapCreated,
      onTapListener: _onTapListener,
      cameraOptions: _cameraOptionsForAllTerritories(),
      styleUri: "https://api.maptiler.com/maps/$accKey/style.json?key=$key",
    );
  }
}
