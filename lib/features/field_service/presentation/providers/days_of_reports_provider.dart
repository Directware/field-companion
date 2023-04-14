import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'days_of_reports_provider.g.dart';

@riverpod
List<DateTime> daysOfReports(DaysOfReportsRef ref) {
  return ref.watch(reportsProvider).maybeWhen(
        data: (reports) => reports
            .map(
              (report) => report.reportDate,
            )
            .toList(),
        orElse: () => [],
      );
}
