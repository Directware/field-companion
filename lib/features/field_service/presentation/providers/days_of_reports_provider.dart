import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'days_of_reports_provider.g.dart';

@riverpod
List<DateTime> daysOfReports(DaysOfReportsRef ref,
    {required DateTime month, int firstDayOfWeek = 1}) {
  final lastDateOfMonth = DateTime(month.year, month.month + 1, 0);
  final firstWeekdayOfMonth = month.weekday;
  final daysBeforeMonth = firstWeekdayOfMonth - firstDayOfWeek;
  final monthWeeksWithSurrounding =
      ((lastDateOfMonth.day + daysBeforeMonth) / 7).ceil();
  final dayCount = monthWeeksWithSurrounding * 7;
  final startDate = month.subtract(Duration(days: daysBeforeMonth));
  final endDate = startDate.add(Duration(days: dayCount - 1));

  return ref
      .watch(reportsProvider)
      .where((report) =>
          report.reportDate == startDate ||
          report.reportDate == endDate ||
          (report.reportDate.isAfter(startDate) &&
              report.reportDate.isBefore(endDate)))
      .map((report) => report.reportDate)
      .toList();
}
