import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'month_reports_provider.g.dart';

@riverpod
List<Report> monthReports(MonthReportsRef ref, {required DateTime month}) {
  final reports = ref.watch(reportsProvider);
  return reports
      .where(
        (report) =>
            report.reportDate.year == month.year &&
            report.reportDate.month == month.month,
      )
      .toList();
}
