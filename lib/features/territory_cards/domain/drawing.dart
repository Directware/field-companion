import 'package:field_companion/features/territory_cards/domain/geo_json_feature.dart';
import 'package:isar/isar.dart';

part 'drawing.g.dart';

@embedded
class Drawing {
  late List<GeoJsonFeature> featureCollection;
}
