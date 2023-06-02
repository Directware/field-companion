import 'package:field_companion/features/territories/domain/models/territory.dart';

abstract class TerritoryRepositoryInterface {
  Future<List<Territory>> getAll();

  Future<void> upsert(Territory territory);

  Future<void> deleteAll();

  Future<void> delete(String id);
}
