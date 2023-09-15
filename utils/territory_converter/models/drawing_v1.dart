import 'package:json_annotation/json_annotation.dart';

import 'print_configuration_v1.dart';
import 'timed_entity_v1.dart';

part 'drawing_v1.g.dart';

@JsonSerializable()
class DrawingV1 extends TimedEntityV1 {
  DrawingV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    required this.featureCollection,
    this.printConfiguration,
  });

  late final Map<String, dynamic> featureCollection;
  late final PrintConfigurationV1? printConfiguration;

  factory DrawingV1.fromJson(Map<String, dynamic> json) =>
      _$DrawingV1FromJson(json);
}
