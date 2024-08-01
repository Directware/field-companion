import 'dart:math' hide log;

import 'package:field_companion/features/field_service/domain/models/studies.dart';
import 'package:field_companion/features/field_service/domain/repositories/studies_repository_interface.dart';
import 'package:isar/isar.dart';

class StudiesRepository implements StudiesRepositoryInterface {
  StudiesRepository(this._database) {
    _collection = _database.studies;
  }

  final Isar _database;
  late final IsarCollection<Studies> _collection;

  @override
  Future<List<Studies>> getByYear(
    DateTime year,
  ) {
    final lastDateOfYear = DateTime(year.year, 12, 0);
    return _collection.where().monthBetween(year, lastDateOfYear).findAll();
  }

  @override
  Future<void> upsert(Studies studies) async {
    await _database.writeTxn(() async {
      await _collection.putByIndex('month', studies);
    });
  }

  @override
  Future<void> deleteAll() async {
    await _database.writeTxn(() async {
      await _collection.clear();
    });
  }

  @override
  Future<void> delete(Id id) async {
    await _database.writeTxn(() async {
      await _collection.delete(id);
    });
  }
}
