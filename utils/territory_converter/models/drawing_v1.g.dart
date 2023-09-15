// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrawingV1 _$DrawingV1FromJson(Map<String, dynamic> json) => DrawingV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      featureCollection: json['featureCollection'] as Map<String, dynamic>,
      printConfiguration: json['printConfiguration'] == null
          ? null
          : PrintConfigurationV1.fromJson(
              json['printConfiguration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DrawingV1ToJson(DrawingV1 instance) => <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'featureCollection': instance.featureCollection,
      'printConfiguration': instance.printConfiguration,
    };
