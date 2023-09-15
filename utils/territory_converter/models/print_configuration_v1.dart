import 'package:json_annotation/json_annotation.dart';

import 'gps_position_v1.dart';
import 'timed_entity_v1.dart';

part 'print_configuration_v1.g.dart';

@JsonSerializable()
class PrintConfigurationV1 extends TimedEntityV1 {
  PrintConfigurationV1({
    super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    this.bearing,
    this.zoom,
    this.pitch,
    this.center,
    this.bounds,
  });

  late final double? bearing;
  late final double? zoom;
  late final double? pitch;
  late final GpsPositionV1? center;
  late final Map<String, dynamic>? bounds;

  factory PrintConfigurationV1.fromJson(Map<String, dynamic> json) =>
      _$PrintConfigurationV1FromJson(json);
}
