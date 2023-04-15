import 'package:field_companion/features/field_service/presentation/providers/reports_stream_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'days_of_reports_provider.g.dart';

@riverpod
List<DateTime> daysOfReports(DaysOfReportsRef ref, {required DateTime month}) {
  return ref
      .watch(reportsStreamProvider(month: month, withSurroundingWeekdays: true))
      .maybeWhen(
        data: (reports) => reports
            .map(
              (report) => report.reportDate,
            )
            .toList(),
        orElse: () => [],
      );
}
