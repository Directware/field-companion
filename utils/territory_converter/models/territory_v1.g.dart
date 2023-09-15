// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TerritoryV1 _$TerritoryV1FromJson(Map<String, dynamic> json) => TerritoryV1(
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
      key: json['key'] as String,
      populationCount: json['populationCount'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      territoryDrawingId: json['territoryDrawingId'] as String,
      boundaryNames: (json['boundaryNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      deactivated: json['deactivated'] as bool?,
      isCreation: json['isCreation'] as bool?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$TerritoryV1ToJson(TerritoryV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'name': instance.name,
      'key': instance.key,
      'populationCount': instance.populationCount,
      'tags': instance.tags,
      'territoryDrawingId': instance.territoryDrawingId,
      'boundaryNames': instance.boundaryNames,
      'deactivated': instance.deactivated,
      'isCreation': instance.isCreation,
      'comment': instance.comment,
    };
