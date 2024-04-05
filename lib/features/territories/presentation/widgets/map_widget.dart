import 'dart:convert';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:permission_handler/permission_handler.dart';
import 'package:turf/turf.dart';

String accessToken = const String.fromEnvironment("PUBLIC_ACCESS_TOKEN");

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

    if (selectedTerritory == null) {
      throw Exception("No territory selected");
    }

    _map = map;

    _map.compass.updateSettings(
      mapbox.CompassSettings(
        enabled: false,
      ),
    );

    _map.attribution.updateSettings(
      mapbox.AttributionSettings(
        marginBottom: 150,
      ),
    );

    _map.logo.updateSettings(
      mapbox.LogoSettings(
        marginBottom: 150,
      ),
    );

    _map.scaleBar.updateSettings(mapbox.ScaleBarSettings(enabled: false));

    for (final territory in territories) {
      final geoJson = json.encode(territory.geoJson);

      await map.style.addSource(
        mapbox.GeoJsonSource(id: territory.key, data: geoJson),
      );

      final fillColor = territory == selectedTerritory
          ? ColorPalette.blueProgressStartOpacity05
          : ColorPalette.grey2;
      final fillOpacity = territory == selectedTerritory ? 0.3 : 0.6;

      map.style.addLayer(
        mapbox.FillLayer(
          id: territory.key,
          sourceId: territory.key,
          fillColor: fillColor.value,
          fillOpacity: fillOpacity,
          fillOutlineColor: ColorPalette.red.value,
        ),
      );
    }

    Future.wait([
      rootBundle.load('assets/images/location-marker.png'),
      rootBundle.load('assets/images/location-bearing.png'),
      rootBundle.load('assets/images/location-shadow.png'),
    ]).then(
      (imagesData) => _map.location.updateSettings(
        mapbox.LocationComponentSettings(
          enabled: true,
          showAccuracyRing: true,
          puckBearingEnabled: true,
          accuracyRingColor: ColorPalette.redOpacity20.value,
          locationPuck: mapbox.LocationPuck(
            locationPuck2D: mapbox.LocationPuck2D(
              topImage: imagesData[0].buffer.asUint8List(),
              bearingImage: imagesData[1].buffer.asUint8List(),
              shadowImage: imagesData[2].buffer.asUint8List(),
              scaleExpression: '2',
            ),
          ),
        ),
      ),
    );
  }

  void _updateSelected(Territory? previous, Territory? current) {
    if (previous != null) {
      _map.style.updateLayer(
        mapbox.FillLayer(
          id: previous.key,
          sourceId: previous.key,
          fillColor: ColorPalette.grey2.value,
          fillOpacity: 0.6,
          fillOutlineColor: ColorPalette.red.value,
        ),
      );
    }

    if (current != null) {
      _map.style.updateLayer(
        mapbox.FillLayer(
          id: current.key,
          sourceId: current.key,
          fillColor: ColorPalette.blueProgressStartOpacity05.value,
          fillOpacity: 0.3,
          fillOutlineColor: ColorPalette.red.value,
        ),
      );

      _focusOnTerritory(current);
    }
  }

  void _focusOnTerritory(Territory? territory) {
    final point = _centerOfTerritory(territory);

    if (point == null) {
      return;
    }

    _map.flyTo(
      mapbox.CameraOptions(
        center: mapbox.Point(
          coordinates: mapbox.Position(
            point.coordinates.lng,
            point.coordinates.lat,
          ),
        ).toJson(),
        zoom: 17.0,
      ),
      mapbox.MapAnimationOptions(duration: 1000),
    );
  }

  mapbox.Point? _centerOfTerritory(Territory? territory) {
    if (territory?.geoJson == null) {
      return null;
    }
    final point = center(mapbox.GeoJSONObject.fromJson(territory!.geoJson));

    if (point.geometry?.coordinates == null) {
      return null;
    }

    return mapbox.Point(
      coordinates: point.geometry!.coordinates,
    );
  }

  Future<void> _onTapListener(mapbox.ScreenCoordinate coord) async {
    // final territoryKeys =
    //     ref.read(territoriesProvider).map((t) => t.key).toList();
    // final mapbox.ScreenCoordinate conv = await _map.pixelForCoordinate(
    //   Point(
    //     coordinates: Position(
    //       coord.y,
    //       coord.x,
    //     ),
    //   ).toJson(),
    // );

    // final List<mapbox.QueriedFeature?> features =
    //     await _map.queryRenderedFeatures(
    //   mapbox.RenderedQueryGeometry(
    //     value: jsonEncode(conv.encode()),
    //     type: mapbox.Type.SCREEN_COORDINATE,
    //   ),
    //   mapbox.RenderedQueryOptions(
    //     layerIds: territoryKeys,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    if (accessToken.isEmpty) {
      throw Exception("No access token for mapbox provided");
    }

    ref.listen<Territory?>(
      selectedTerritoryProvider,
      _updateSelected,
    );

    final selectedTerritory = ref.read(selectedTerritoryProvider);

    return mapbox.MapWidget(
      resourceOptions: mapbox.ResourceOptions(accessToken: accessToken),
      onMapCreated: _onMapCreated,
      styleUri:
          "https://api.maptiler.com/maps/8a0d25a8-3989-4508-9a15-eb9b6366b3fb/style.json?key=JAC0nmE7iwuArAWW6eTi",
      cameraOptions: mapbox.CameraOptions(
        center: _centerOfTerritory(selectedTerritory)?.toJson(),
        zoom: 17.0,
      ),
      onTapListener: _onTapListener,
    );
  }
}
