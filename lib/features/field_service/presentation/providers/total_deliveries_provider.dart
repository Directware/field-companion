import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_deliveries_provider.g.dart';

@riverpod
int totalDeliveries(TotalDeliveriesRef ref) {
  return ref.watch(reportsProvider).maybeWhen(
        data: (reports) => reports.fold(
          0,
          (previousValue, report) => previousValue + report.deliveries,
        ),
        orElse: () => 0,
      );
}
