import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'territory.g.dart';

@HiveType(typeId: 4)
class Territory extends Entity {
  Territory()
      : name = "",
        key = "",
        populationCount = 0,
        tags = [],
        territoryDrawingId = "",
        boundaryNames = [],
        deactivated = false,
        comment = "";

  @HiveField(4)
  String name;

  @HiveField(5)
  String key;

  @HiveField(6)
  int populationCount;

  @HiveField(7)
  List<String> tags;

  @HiveField(8)
  String territoryDrawingId;

  List<String> boundaryNames;

  @HiveField(9)
  bool deactivated;

  @HiveField(10)
  String comment;
}
