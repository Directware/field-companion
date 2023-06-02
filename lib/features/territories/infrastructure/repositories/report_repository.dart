import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/domain/repositories/territory_repository_interface.dart';
import 'package:isar/isar.dart';

class TerritoryRepository implements TerritoryRepositoryInterface {
  TerritoryRepository(this._database) {
    _collection = _database.territories;
  }

  final Isar _database;
  late final IsarCollection<Territory> _collection;

  @override
  Future<List<Territory>> getAll() {
    return _collection.where().findAll();
  }

  @override
  Future<void> upsert(Territory territory) async {
    await _database.writeTxn(() async {
      await _collection.putByIndex('id', territory);
    });
  }

  @override
  Future<void> deleteAll() async {
    await _database.writeTxn(() async {
      await _collection.clear();
    });
  }

  @override
  Future<void> delete(String id) async {
    await _database.writeTxn(() async {
      await _collection.deleteByIndex('id', [id]);
    });
  }
}
