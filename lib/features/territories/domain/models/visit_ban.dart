import 'package:field_companion/features/territories/domain/models/position.dart';
import 'package:isar/isar.dart';

part 'visit_ban.g.dart';

@embedded
class VisitBan {
  late String name;
  late String street;
  late String streetSuffix;
  late String territoryId;
  List<String> tags = [];
  String? city;
  int? floor;
  DateTime? lastVisit;
  String? comment;
  Position? gpsPosition;
}
