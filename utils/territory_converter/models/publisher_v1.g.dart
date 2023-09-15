// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherV1 _$PublisherV1FromJson(Map<String, dynamic> json) => PublisherV1(
      id: json['id'] as String?,
      prefix: json['prefix'] as String?,
      congregationId: json['congregationId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      dsgvoSignature: json['dsgvoSignature'] as String?,
      isDeactivated: json['isDeactivated'] as bool?,
    );

Map<String, dynamic> _$PublisherV1ToJson(PublisherV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prefix': instance.prefix,
      'congregationId': instance.congregationId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'name': instance.name,
      'firstName': instance.firstName,
      'email': instance.email,
      'phone': instance.phone,
      'tags': instance.tags,
      'dsgvoSignature': instance.dsgvoSignature,
      'isDeactivated': instance.isDeactivated,
    };
