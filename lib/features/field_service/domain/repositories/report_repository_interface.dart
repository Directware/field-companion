import 'package:field_companion/features/field_service/domain/models/report.dart';

abstract class ReportRepositoryInterface {
  Stream<List<Report>> getAllByMonth(
    DateTime month, {
    bool withSurroundingWeekdays,
  });

  Stream<Report?> get(DateTime date);

  Future<void> upsert(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
    int? studies,
  });
}
