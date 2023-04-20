import 'package:field_companion/features/territory_cards/domain/models/geo_json_context.dart';
import 'package:field_companion/features/territory_cards/domain/models/geo_json_geometry.dart';
import 'package:isar/isar.dart';

part 'geo_json_feature.g.dart';

@embedded
class GeoJsonFeature {
  late String id;
  late String type;
  late List<String> placeType;
  late int relevance;
  //late dynamic properties;
  late String text;
  late String placeName;
  late List<double> bbox;
  late List<double> center;
  late GeoJsonGeometry geometry;
  late List<GeoJsonContext> context;
}
