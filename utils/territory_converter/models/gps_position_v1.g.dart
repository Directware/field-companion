// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_position_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GpsPositionV1 _$GpsPositionV1FromJson(Map<String, dynamic> json) =>
    GpsPositionV1(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$GpsPositionV1ToJson(GpsPositionV1 instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
