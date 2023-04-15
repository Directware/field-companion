import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports_stream_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_month_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_month_reports_provider.g.dart';

@riverpod
Future<List<Report>> selectedMonthReports(SelectedMonthReportsRef ref) {
  final month = ref.watch(selectedMonthProvider);
  return ref.watch(reportsStreamProvider(month: month).future);
}
