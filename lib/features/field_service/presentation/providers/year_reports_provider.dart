import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_month_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'year_reports_provider.g.dart';

@riverpod
List<Report> yearReports(YearReportsRef ref) {
  final selectedMonth = ref.watch(selectedMonthProvider);
  final firstMonth = selectedMonth.month >= 9
      ? DateTime(selectedMonth.year, 9)
      : DateTime(selectedMonth.year - 1, 9);
  final months = [
    for (var month = 0; month < 12; month++)
      DateTime(firstMonth.year, firstMonth.month + month - 1)
  ];

  return ref.watch(reportsProvider).where(
    (report) {
      for (final month in months) {
        if (month.year == report.reportDate.year &&
            month.month == report.reportDate.month) return true;
      }
      return false;
    },
  ).toList();
}
