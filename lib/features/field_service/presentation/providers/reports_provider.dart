import 'dart:developer';
import 'dart:math' hide log;

import 'package:collection/collection.dart';
import 'package:field_companion/features/field_service/domain/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_month_provider.dart';
import 'package:field_companion/providers/database_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports_provider.g.dart';

@riverpod
class Reports extends _$Reports {
  late final Isar _database;

  @override
  Future<List<Report>> build() async {
    _database = ref.watch(databaseProvider);
    final firstDateOfMonth = ref.watch(selectedMonthProvider);
    final lastDateOfMonth =
        DateTime(firstDateOfMonth.year, firstDateOfMonth.month + 1, 0);

    await _database.writeTxn(() async {
      await _database.reports.where().deleteAll();

      final count = 1 + Random().nextInt(30 - 1);

      for (var i = 0; i < count; i++) {
        final date = DateTime.now()
            .add(Duration(days: -30 + Random().nextInt(30 - -30)));
        final report = Report.create(date);
        report.update(
          videos: 1 + Random().nextInt(10 - 1),
          studies: 1 + Random().nextInt(10 - 1),
          deliveries: 1 + Random().nextInt(10 - 1),
          duration: 1 + Random().nextInt(4 * 60 - 1),
          returnVisits: 1 + Random().nextInt(10 - 1),
        );
        report.lastUpdated = date;
        await _database.reports.putByIndex('reportDate', report);
      }
    });

    final reports = await _database.reports
        .filter()
        .reportDateBetween(firstDateOfMonth, lastDateOfMonth)
        .findAll();

    log('$reports');

    return reports;
  }

  Future<void> set(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
    int? studies,
  }) async {
    final report =
        state.value?.firstWhereOrNull((item) => item.reportDate == date) ??
            Report.create(date);

    report.update(
      videos: videos,
      returnVisits: returnVisits,
      deliveries: deliveries,
      duration: duration,
      studies: studies,
    );

    state = AsyncValue.data(state.value ?? []);

    await _database.writeTxn(() async {
      await _database.reports.putByIndex('reportDate', report);
    });
  }
}
