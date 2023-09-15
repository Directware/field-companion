import 'package:json_annotation/json_annotation.dart';

import 'timed_entity_v1.dart';

part 'assignment_v1.g.dart';

@JsonSerializable()
class AssignmentV1 extends TimedEntityV1 {
  AssignmentV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    required this.publisherId,
    required this.territoryId,
    required this.startTime,
    this.endTime,
    this.statusColor,
    this.removedPublisherLabel,
  });

  late final String publisherId;
  late final String territoryId;
  late final DateTime startTime;
  late final DateTime? endTime;
  late final String? statusColor;
  late final String? removedPublisherLabel;

  factory AssignmentV1.fromJson(Map<String, dynamic> json) =>
      _$AssignmentV1FromJson(json);
}
