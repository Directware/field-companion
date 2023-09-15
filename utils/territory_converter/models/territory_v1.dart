import 'package:json_annotation/json_annotation.dart';

import 'timed_entity_v1.dart';

part 'territory_v1.g.dart';

@JsonSerializable()
class TerritoryV1 extends TimedEntityV1 {
  TerritoryV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    required this.name,
    required this.key,
    required this.populationCount,
    required this.tags,
    required this.territoryDrawingId,
    required this.boundaryNames,
    this.deactivated,
    this.isCreation,
    this.comment,
  });

  late final String name;
  late final String key;
  late final int populationCount;
  late final List<String> tags;
  late final String territoryDrawingId;
  late final List<String> boundaryNames;
  late final bool? deactivated;
  late final bool? isCreation;
  late final String? comment;

  factory TerritoryV1.fromJson(Map<String, dynamic> json) =>
      _$TerritoryV1FromJson(json);
}
