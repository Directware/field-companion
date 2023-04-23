import 'package:field_companion/features/core/presentation/providers/database_provider.dart';
import 'package:field_companion/features/field_service/infrastructure/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ReportRepository reportRepository(ReportRepositoryRef ref) {
  final database = ref.watch(databaseProvider);
  return ReportRepository(database);
}
