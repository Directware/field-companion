import 'package:field_companion/features/field_service/domain/models/studies.dart';
import 'package:isar/isar.dart';

abstract class StudiesRepositoryInterface {
  Future<List<Studies>> getByYear(
    DateTime year,
  );

  Future<void> upsert(Studies studies);

  Future<void> delete(Id id);

  Future<void> deleteAll();
}
