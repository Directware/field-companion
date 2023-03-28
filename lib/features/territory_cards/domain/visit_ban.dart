import 'package:field_companion/features/territory_cards/domain/position.dart';
import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'visit_ban.g.dart';

@HiveType(typeId: 8)
class VisitBan extends Entity {
  VisitBan({
    required this.name,
    required this.street,
    required this.streetSuffix,
    required this.territoryId,
    this.tags = const [],
    this.city,
    this.floor,
    this.lastVisit,
    this.comment,
    this.gpsPosition,
  });

  @HiveField(4)
  String name;

  @HiveField(5)
  String street;

  @HiveField(6)
  String streetSuffix;

  @HiveField(7)
  String territoryId;

  @HiveField(8)
  List<String> tags;

  @HiveField(9)
  String? city;

  @HiveField(10)
  int? floor;

  @HiveField(11)
  DateTime? lastVisit;

  @HiveField(12)
  String? comment;

  @HiveField(13)
  Position? gpsPosition;
}
