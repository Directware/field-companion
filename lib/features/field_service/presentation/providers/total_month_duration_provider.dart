import 'package:field_companion/features/field_service/presentation/providers/selected_month_reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_month_duration_provider.g.dart';

@riverpod
int totalMonthDuration(TotalMonthDurationRef ref) {
  return ref.watch(selectedMonthReportsProvider).fold(
        0,
        (previousValue, report) => previousValue + report.duration,
      );
}
