// ignore: uri_does_not_exist
import 'dart:developer';

import 'package:field_companion/api_key.dart';
import 'package:field_companion/features/territories/presentation/models/geo_json_parser.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class VectorMap extends ConsumerStatefulWidget {
  const VectorMap({super.key});

  @override
  ConsumerState<VectorMap> createState() => _VectorMapState();
}

class _VectorMapState extends ConsumerState<VectorMap> {
  GeoJsonParser myGeoJson = GeoJsonParser();

  Future<Style> _readStyle() => StyleReader(
        uri: "mapbox://styles/mapbox/streets-v12?access_token={key}",
        // ignore: undefined_identifier
        apiKey: mapboxApiKey,
      ).read();

  Future<Style?> _initStyle() async {
    final territory = ref.watch(selectedTerritoryProvider);
    try {
      if (territory != null) {
        log('Parsing GeoJson');
        myGeoJson.parseGeoJson(territory.geoJson);
      }
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
                /*AttributionWidget.defaultWidget(
                  source: '© Mapbox © OpenStreetMap',
                  onSourceTapped: () async {
                    // Requires 'url_launcher'
                    if (!await launchUrl(Uri.parse(
                        "https://docs.mapbox.com/help/getting-started/attribution/"))) {
                      if (kDebugMode) print('Could not launch URL');
                    }
                  },
                )*/
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
                PolylineLayer(polylines: myGeoJson.polylines)
              ],
            )
          : Container(),
    );
  }
}
