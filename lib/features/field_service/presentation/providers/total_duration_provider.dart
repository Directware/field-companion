import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_duration_provider.g.dart';

@riverpod
int totalDuration(TotalDurationRef ref) {
  return ref.watch(reportsProvider).maybeWhen(
        data: (reports) => reports.fold(
          0,
          (previousValue, report) => previousValue + report.duration,
        ),
        orElse: () => 0,
      );
}
