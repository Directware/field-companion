import 'package:json_annotation/json_annotation.dart';

import 'timed_entity_v1.dart';

part 'publisher_v1.g.dart';

@JsonSerializable()
class PublisherV1 extends TimedEntityV1 {
  PublisherV1({
    required super.id,
    super.prefix,
    super.congregationId,
    required super.creationTime,
    super.lastUpdated,
    this.name,
    this.firstName,
    this.email,
    this.phone,
    required this.tags,
    this.dsgvoSignature,
    this.isDeactivated,
  });

  late final String? name;
  late final String? firstName;
  late final String? email;
  late final String? phone;
  late final List<String> tags;
  late final String? dsgvoSignature;
  late final bool? isDeactivated;

  factory PublisherV1.fromJson(Map<String, dynamic> json) =>
      _$PublisherV1FromJson(json);
}
