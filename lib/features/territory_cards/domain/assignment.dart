import 'package:field_companion/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:field_companion/features/territory_cards/domain/publisher.dart';

part 'assignment.g.dart';

@HiveType(typeId: 7)
class Assignment extends Entity {
  Assignment({required this.publisher, this.endTime})
      : startTime = DateTime.now();

  @HiveField(4)
  Publisher publisher;

  @HiveField(5)
  DateTime startTime;

  @HiveField(6)
  DateTime? endTime;
}
