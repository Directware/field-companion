import 'package:field_companion/features/territory_cards/domain/geo_json_context.dart';
import 'package:field_companion/features/territory_cards/domain/geo_json_geometry.dart';

class GeoJsonFeature {
  GeoJsonFeature(
      {required this.id,
      required this.type,
      required this.placeType,
      required this.relevance,
      required this.properties,
      required this.text,
      required this.placeName,
      required this.bbox,
      required this.center,
      required this.geometry,
      required this.context});

  String id;
  String type;
  List<String> placeType;
  int relevance;
  dynamic properties;
  String text;
  String placeName;
  List<double> bbox;
  List<double> center;
  GeoJsonGeometry geometry;
  List<GeoJsonContext> context;
}
