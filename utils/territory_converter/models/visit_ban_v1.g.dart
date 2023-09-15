// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_ban_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitBanV1 _$VisitBanV1FromJson(Map<String, dynamic> json) => VisitBanV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      name: json['name'] as String,
      street: json['street'] as String,
      streetSuffix: json['streetSuffix'] as String,
      territoryId: json['territoryId'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      city: json['city'] as String?,
      floor: VisitBanV1._emptyStringToNull(json['floor']),
      lastVisit: VisitBanV1._emptyStringToNull(json['lastVisit']),
      comment: json['comment'] as String?,
      gpsPosition: json['gpsPosition'] == null
          ? null
          : GpsPositionV1.fromJson(json['gpsPosition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisitBanV1ToJson(VisitBanV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'name': instance.name,
      'street': instance.street,
      'streetSuffix': instance.streetSuffix,
      'territoryId': instance.territoryId,
      'tags': instance.tags,
      'city': instance.city,
      'floor': instance.floor,
      'lastVisit': instance.lastVisit?.toIso8601String(),
      'comment': instance.comment,
      'gpsPosition': instance.gpsPosition,
    };
