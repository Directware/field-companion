import 'dart:math';

import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/domain/repositories/report_repository_interface.dart';
import 'package:isar/isar.dart';

class ReportRepository implements ReportRepositoryInterface {
  ReportRepository(this._database, [this._firstDayOfWeek = 1]) {
    _collection = _database.reports;
    createTestEntities();
  }

  final Isar _database;
  final int _firstDayOfWeek;
  late final IsarCollection<Report> _collection;
  late final Future<void> init = Future.value();

  Future<void> createTestEntities() async {
    await _database.writeTxn(() async {
      await _database.reports.where().deleteAll();

      final count = 1 + Random().nextInt(31 - 1);

      final now = DateTime.now();
      final startDate = DateTime(now.year, now.month - 6);
      for (var month = 0; month < 12; month++) {
        for (var i = 0; i < count; i++) {
          final date = DateTime(
            startDate.year,
            startDate.month + month,
            1 + Random().nextInt(31 - 1),
          );
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
      }
    });
  }

  @override
  Stream<List<Report>> getAllByMonth(
    DateTime month, {
    bool withSurroundingWeekdays = false,
  }) {
    final lastDateOfMonth = DateTime(month.year, month.month + 1, 0);

    DateTime startDate;
    DateTime endDate;

    if (withSurroundingWeekdays) {
      final firstWeekdayOfMonth = month.weekday;
      final daysBeforeMonth = firstWeekdayOfMonth - _firstDayOfWeek;
      final monthWeeksWithSurrounding =
          ((lastDateOfMonth.day + daysBeforeMonth) / 7).ceil();
      final dayCount = monthWeeksWithSurrounding * 7;

      startDate = month.subtract(Duration(days: daysBeforeMonth));
      endDate = startDate.add(Duration(days: dayCount - 1));
    } else {
      startDate = month;
      endDate = lastDateOfMonth;
    }

    return _collection
        .filter()
        .reportDateBetween(startDate, endDate)
        .build()
        .watch(fireImmediately: true);
  }

  @override
  Future<void> upsert(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
    int? studies,
  }) async {
    final report =
        await _collection.filter().reportDateEqualTo(date).findFirst() ??
            Report.create(date);

    report.update(
      videos: videos,
      returnVisits: returnVisits,
      deliveries: deliveries,
      duration: duration,
      studies: studies,
    );

    await _database.writeTxn(() async {
      await _collection.putByIndex('reportDate', report);
    });
  }
}
