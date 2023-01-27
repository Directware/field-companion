import 'package:hive/hive.dart';
import 'package:nanoid/nanoid.dart';

@HiveType(typeId: 0)
class Entity extends HiveObject {
  Entity()
      : id = nanoid(21),
        creationTime = DateTime.now(),
        lastUpdated = DateTime.now(),
        excludeStatistic = false;

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime creationTime;

  @HiveField(2)
  DateTime lastUpdated;

  @HiveField(3)
  bool excludeStatistic;
}
