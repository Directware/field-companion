import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:permission_handler/permission_handler.dart';

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
    final territory = ref.watch(selectedTerritoryProvider);
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

    _map.annotations.createPolygonAnnotationManager().then((annotationManager) {
      final options = <mapbox.PolygonAnnotationOptions>[];
      for (var i = 0; i < 2; i++) {
        options.add(territory.geoJson);
      }
      annotationManager.createMulti(territory.geoJson);
      annotationManager.annotationManager
          .addOnPolygonAnnotationClickListener(AnnotationClickListener());
    });

    Future.wait([
      rootBundle.load('assets/images/location-marker.png'),
      rootBundle.load('assets/images/location-bearing.png'),
      rootBundle.load('assets/images/location-shadow.png')
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

  @override
  Widget build(BuildContext context) {
    return mapbox.MapWidget(
      resourceOptions: mapbox.ResourceOptions(accessToken: accessToken),
      onMapCreated: _onMapCreated,
      //styleUri: mapbox.MapboxStyles.MAPBOX_STREETS,
      cameraOptions: mapbox.CameraOptions(
        center: mapbox.Point(coordinates: mapbox.Position(10.860545, 48.355344))
            .toJson(),
        zoom: 17.0,
      ),
    );
  }
}
