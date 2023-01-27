import 'package:field_companion/features/territory_cards/domain/geo_json_feature.dart';
import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'drawing.g.dart';

@HiveType(typeId: 5)
class Drawing extends Entity {
  Drawing({required this.featureCollection});

  @HiveField(4)
  List<GeoJsonFeature> featureCollection;
}
