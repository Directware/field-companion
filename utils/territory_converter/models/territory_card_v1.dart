import 'package:json_annotation/json_annotation.dart';

import 'assignment_v1.dart';
import 'drawing_v1.dart';
import 'publisher_v1.dart';
import 'territory_v1.dart';
import 'timed_entity_v1.dart';
import 'visit_ban_v1.dart';

part 'territory_card_v1.g.dart';

@JsonSerializable()
class TerritoryCardV1 extends TimedEntityV1 {
  TerritoryCardV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    required this.territory,
    required this.drawing,
    required this.publisher,
    required this.assignment,
    required this.visitBans,
    required this.estimationInMonths,
    this.deactivated,
  });

  late final TerritoryV1 territory;
  late final DrawingV1 drawing;
  late final PublisherV1 publisher;
  late final AssignmentV1 assignment;
  late final List<VisitBanV1> visitBans;
  late final int estimationInMonths;
  late final bool? deactivated;

  factory TerritoryCardV1.fromJson(Map<String, dynamic> json) =>
      _$TerritoryCardV1FromJson(json);
}
