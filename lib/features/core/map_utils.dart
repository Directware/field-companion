import 'dart:convert';
import 'package:field_companion/features/territories/domain/models/territory.dart';

String territoriesToGeoJSON(List<Territory> territories) {
  final features = territories.map((Territory territory) {
    final geoJSON = territory.geoJson;

    assert(geoJSON["features"] != null);

    geoJSON["features"] as List<dynamic>;

    return {
      'type': 'Feature',
      'properties': {'label': territory.key},
      // ignore: avoid_dynamic_calls
      'geometry': geoJSON["features"].first["geometry"],
    };
  }).toList();

  return json.encode({
    'type': 'FeatureCollection',
    'features': features,
  });
}
