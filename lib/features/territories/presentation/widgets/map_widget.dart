import 'dart:convert';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:permission_handler/permission_handler.dart';
import 'package:latlong2/latlong.dart';
import 'package:turf/center.dart';
import 'package:turf/helpers.dart';
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

  Future<void> _onMapCreated(mapbox.MapboxMap mapboxMap) async {
    final selectedTerritory = ref.read(selectedTerritoryProvider);

    if (selectedTerritory == null) {
      throw Exception("No territory selected");
    }

    _map = mapboxMap;

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

    final geoJson = json.encode(selectedTerritory.geoJson);

    await mapboxMap.style.addSource(
      mapbox.GeoJsonSource(id: selectedTerritory.key, data: geoJson),
    );

    await mapboxMap.style.addLayer(
      mapbox.FillLayer(
        id: selectedTerritory.key,
        sourceId: selectedTerritory.key,
        fillColor: ColorPalette.blueProgressStartOpacity05.value,
        fillOpacity: 0.3,
      ),
    );

    // Future.wait([
    //   rootBundle.load('assets/images/location-marker.png'),
    //   rootBundle.load('assets/images/location-bearing.png'),
    //   rootBundle.load('assets/images/location-shadow.png')
    // ]).then(
    //   (imagesData) => _map.location.updateSettings(
    //     mapbox.LocationComponentSettings(
    //       enabled: true,
    //       showAccuracyRing: true,
    //       puckBearingEnabled: true,
    //       accuracyRingColor: ColorPalette.redOpacity20.value,
    //       locationPuck: mapbox.LocationPuck(
    //         locationPuck2D: mapbox.LocationPuck2D(
    //           topImage: imagesData[0].buffer.asUint8List(),
    //           bearingImage: imagesData[1].buffer.asUint8List(),
    //           shadowImage: imagesData[2].buffer.asUint8List(),
    //           scaleExpression: '2',
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  void focusOnTerritory(Territory? territory) {
    print("focusOnTerritory");

    if (territory == null) {
      return;
    }

    final point = center(mapbox.GeoJSONObject.fromJson(territory.geoJson));

    _map.flyTo(
      mapbox.CameraOptions(
        center: mapbox.Point(
                coordinates: mapbox.Position(point.geometry!.coordinates.lng,
                    point.geometry!.coordinates.lat))
            .toJson(),
        zoom: 17.0,
      ),
      mapbox.MapAnimationOptions(duration: 1000),
    );
  }

  mapbox.Point? centerOfTerritory(Territory? territory) {
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

  @override
  Widget build(BuildContext context) {
    if (accessToken.isEmpty) {
      throw Exception("No access token for mapbox provided");
    }

    ref.listen(
      selectedTerritoryProvider,
      (previous, next) => focusOnTerritory(next),
    );

    final selectedTerritory = ref.read(selectedTerritoryProvider);

    return mapbox.MapWidget(
      resourceOptions: mapbox.ResourceOptions(accessToken: accessToken),
      onMapCreated: _onMapCreated,
      styleUri: "https://api.maptiler.com/maps/8a0d25a8-3989-4508-9a15-eb9b6366b3fb/style.json?key=JAC0nmE7iwuArAWW6eTi",
      cameraOptions: mapbox.CameraOptions(
        center: centerOfTerritory(selectedTerritory)?.toJson(),
        zoom: 17.0,
      ),
    );
  }
}
