import 'package:collection/collection.dart';
import 'package:field_companion/features/field_service/domain/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/date_provider.dart';
import 'package:field_companion/providers/database_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports_provider.g.dart';

@riverpod
class Reports extends _$Reports {
  late final Isar _database;

  @override
  Future<List<Report>> build() {
    _database = ref.watch(databaseProvider);
    final date = ref.watch(dateProvider);
    final firstDateOfMonth = DateTime(date.year, date.month);
    final lastDateOfMonth = DateTime(date.year, date.month + 1, 0);

    return _database.reports
        .filter()
        .reportDateBetween(firstDateOfMonth, lastDateOfMonth)
        .findAll();
  }

  Future<void> set(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? duration,
    int? studies,
  }) async {
    final report =
        state.value?.firstWhereOrNull((item) => item.reportDate == date) ??
            Report.create(date);

    report.update(
      videos: videos,
      returnVisits: returnVisits,
      duration: duration,
      studies: studies,
    );

    state = AsyncValue.data(state.value ?? []);

    await _database.writeTxn(() async {
      await _database.reports.putByIndex('reportDate', report);
    });
  }
}
