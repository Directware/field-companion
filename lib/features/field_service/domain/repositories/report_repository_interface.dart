import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:isar/isar.dart';

abstract class ReportRepositoryInterface {
  Future<List<Report>> getByMonths(
    List<DateTime> month,
  );

  Future<void> upsert(Report report);

  Future<void> deleteAll();

  Future<void> delete(Id id);
}
