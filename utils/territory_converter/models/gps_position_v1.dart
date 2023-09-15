import 'package:json_annotation/json_annotation.dart';

part 'gps_position_v1.g.dart';

@JsonSerializable()
class GpsPositionV1 {
  GpsPositionV1({
    required this.lat,
    required this.lng,
  });

  late final double lat;
  late final double lng;

  factory GpsPositionV1.fromJson(Map<String, dynamic> json) =>
      _$GpsPositionV1FromJson(json);
}
