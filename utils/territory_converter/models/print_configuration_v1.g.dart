// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_configuration_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintConfigurationV1 _$PrintConfigurationV1FromJson(
        Map<String, dynamic> json) =>
    PrintConfigurationV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      bearing: (json['bearing'] as num?)?.toDouble(),
      zoom: (json['zoom'] as num?)?.toDouble(),
      pitch: (json['pitch'] as num?)?.toDouble(),
      center: json['center'] == null
          ? null
          : GpsPositionV1.fromJson(json['center'] as Map<String, dynamic>),
      bounds: json['bounds'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PrintConfigurationV1ToJson(
        PrintConfigurationV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'bearing': instance.bearing,
      'zoom': instance.zoom,
      'pitch': instance.pitch,
      'center': instance.center,
      'bounds': instance.bounds,
    };
