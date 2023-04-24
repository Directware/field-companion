// ignore: uri_does_not_exist
import 'package:field_companion/api_key.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class VectorMap extends StatefulWidget {
  const VectorMap({super.key});

  @override
  State<VectorMap> createState() => _VectorMapState();
}

class _VectorMapState extends State<VectorMap> {
  Future<Style> _readStyle() => StyleReader(
        uri: "mapbox://styles/mapbox/streets-v12?access_token={key}",
        // ignore: undefined_identifier
        apiKey: mapboxApiKey,
      ).read();

  Future<Style?> _initStyle() async {
    try {
      final style = await _readStyle();
      return style;
    } catch (e, stack) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(stack);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initStyle(),
      builder: (context, snapshot) => snapshot.data != null
          ? FlutterMap(
              options: MapOptions(
                center: LatLng(48.355344, 10.860545),
                zoom: 17,
                interactiveFlags: InteractiveFlag.drag |
                    InteractiveFlag.flingAnimation |
                    InteractiveFlag.pinchMove |
                    InteractiveFlag.pinchZoom |
                    InteractiveFlag.doubleTapZoom,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: '© Mapbox © OpenStreetMap',
                  onSourceTapped: () async {
                    // Requires 'url_launcher'
                    if (!await launchUrl(Uri.parse(
                        "https://docs.mapbox.com/help/getting-started/attribution/"))) {
                      if (kDebugMode) print('Could not launch URL');
                    }
                  },
                )
              ],
              children: [
                VectorTileLayer(
                  tileProviders: snapshot.data!.providers,
                  theme: snapshot.data!.theme,
                  maximumZoom: 22,
                  tileOffset: TileOffset.mapbox,
                ),
                CurrentLocationLayer(
                  moveAnimationDuration: const Duration(milliseconds: 500),
                ),
              ],
            )
          : Container(),
    );
  }
}
