import 'package:field_companion/features/field_service/presentation/providers/year_reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_year_duration_provider.g.dart';

@riverpod
int totalYearDuration(TotalYearDurationRef ref) {
  return ref.watch(yearReportsProvider).fold(
        0,
        (previousValue, report) => previousValue + report.duration,
      );
}
