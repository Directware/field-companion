import 'package:json_annotation/json_annotation.dart';

import 'gps_position_v1.dart';
import 'timed_entity_v1.dart';

part 'visit_ban_v1.g.dart';

@JsonSerializable()
class VisitBanV1 extends TimedEntityV1 {
  VisitBanV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    required this.name,
    required this.street,
    required this.streetSuffix,
    required this.territoryId,
    required this.tags,
    this.city,
    this.floor,
    this.lastVisit,
    this.comment,
    this.gpsPosition,
  });

  late final String name;
  late final String street;
  late final String streetSuffix;
  late final String territoryId;
  late final List<String> tags;
  late final String? city;
  @JsonKey(fromJson: _emptyStringToNull)
  late final int? floor;
  @JsonKey(fromJson: _emptyStringToNull)
  late final DateTime? lastVisit;
  late final String? comment;
  late final GpsPositionV1? gpsPosition;

  factory VisitBanV1.fromJson(Map<String, dynamic> json) =>
      _$VisitBanV1FromJson(json);

  static T? _emptyStringToNull<T>(dynamic value) =>
      value is String && value.isEmpty ? null : value as T;
}
