import 'package:field_companion/features/field_service/domain/models/report.dart';

abstract class ReportRepositoryInterface {
  Future<List<Report>> getByMonths(
    List<DateTime> month,
  );

  Future<void> upsert(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
    int? studies,
  });
}
