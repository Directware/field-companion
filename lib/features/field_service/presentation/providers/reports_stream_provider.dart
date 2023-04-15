import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports_stream_provider.g.dart';

@riverpod
Stream<List<Report>> reportsStream(
  ReportsStreamRef ref, {
  required DateTime month,
  bool withSurroundingWeekdays = false,
}) {
  return ref
      .watch(reportRepositoryProvider)
      .getAllByMonth(month, withSurroundingWeekdays: withSurroundingWeekdays);
}
