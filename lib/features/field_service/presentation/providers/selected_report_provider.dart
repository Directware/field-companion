import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/report_stream_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_date_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_report_provider.g.dart';

@riverpod
Report? selectedReport(SelectedReportRef ref) {
  final selectedDate = ref.watch(selectedDateProvider);

  if (selectedDate == null) return null;

  return ref.watch(reportStreamProvider(date: selectedDate)).maybeWhen(
        data: (report) => report,
        orElse: () => null,
      );
}
