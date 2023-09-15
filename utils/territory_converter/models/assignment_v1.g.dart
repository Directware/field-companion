// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentV1 _$AssignmentV1FromJson(Map<String, dynamic> json) => AssignmentV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      publisherId: json['publisherId'] as String,
      territoryId: json['territoryId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      statusColor: json['statusColor'] as String?,
      removedPublisherLabel: json['removedPublisherLabel'] as String?,
    );

Map<String, dynamic> _$AssignmentV1ToJson(AssignmentV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'publisherId': instance.publisherId,
      'territoryId': instance.territoryId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'statusColor': instance.statusColor,
      'removedPublisherLabel': instance.removedPublisherLabel,
    };
