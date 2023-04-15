import 'package:field_companion/features/field_service/presentation/providers/selected_month_reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_return_visits_provider.g.dart';

@riverpod
int totalReturnVisits(TotalReturnVisitsRef ref) {
  return ref.watch(selectedMonthReportsProvider).maybeWhen(
        data: (reports) => reports.fold(
          0,
          (previousValue, report) => previousValue + report.returnVisits,
        ),
        orElse: () => 0,
      );
}
