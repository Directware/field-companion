// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory_card_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TerritoryCardV1 _$TerritoryCardV1FromJson(Map<String, dynamic> json) =>
    TerritoryCardV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      territory:
          TerritoryV1.fromJson(json['territory'] as Map<String, dynamic>),
      drawing: DrawingV1.fromJson(json['drawing'] as Map<String, dynamic>),
      publisher:
          PublisherV1.fromJson(json['publisher'] as Map<String, dynamic>),
      assignment:
          AssignmentV1.fromJson(json['assignment'] as Map<String, dynamic>),
      visitBans: (json['visitBans'] as List<dynamic>)
          .map((e) => VisitBanV1.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimationInMonths: json['estimationInMonths'] as int,
      deactivated: json['deactivated'] as bool?,
    );

Map<String, dynamic> _$TerritoryCardV1ToJson(TerritoryCardV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'territory': instance.territory,
      'drawing': instance.drawing,
      'publisher': instance.publisher,
      'assignment': instance.assignment,
      'visitBans': instance.visitBans,
      'estimationInMonths': instance.estimationInMonths,
      'deactivated': instance.deactivated,
    };
