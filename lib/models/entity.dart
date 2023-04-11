import 'package:isar/isar.dart';
import 'package:nanoid/nanoid.dart';

class Entity {
  Entity()
      : id = nanoid(),
        creationTime = DateTime.now(),
        lastUpdated = DateTime.now(),
        excludeStatistic = false;

  @Index()
  String id;

  Id get isarId => fastHash(id);

  DateTime creationTime;
  DateTime lastUpdated;
  bool excludeStatistic;
}

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
