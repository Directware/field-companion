import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_stream_provider.g.dart';

@riverpod
Stream<Report?> reportStream(
  ReportStreamRef ref, {
  required DateTime date,
}) {
  return ref.watch(reportRepositoryProvider).get(date);
}
