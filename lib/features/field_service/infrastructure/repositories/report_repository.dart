import 'dart:math' hide log;

import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/domain/repositories/report_repository_interface.dart';
import 'package:isar/isar.dart';

class ReportRepository implements ReportRepositoryInterface {
  ReportRepository(this._database) {
    _collection = _database.reports;
    createTestEntities();
  }

  final Isar _database;
  late final IsarCollection<Report> _collection;

  Future<void> createTestEntities() async {
    await _database.writeTxn(() async {
      await _collection.where().deleteAll();

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

          final report = Report(
            reportDate: date,
            videos: 1 + Random().nextInt(10 - 1),
            //studies: 1 + Random().nextInt(10 - 1),
            deliveries: 1 + Random().nextInt(10 - 1),
            duration: 1 + Random().nextInt(4 * 60 - 1),
            returnVisits: 1 + Random().nextInt(10 - 1),
          );
          await _collection.putByIndex('reportDate', report);
        }
      }
    });
  }

  @override
  Future<List<Report>> getByMonths(
    List<DateTime> months,
  ) {
    if (months.isEmpty) return Future.value([]);

    final lastDateOfMonth =
        DateTime(months.first.year, months.first.month + 1, 0);
    var query =
        _collection.where().reportDateBetween(months.first, lastDateOfMonth);

    months.skip(1).forEach((month) {
      final lastDateOfMonth = DateTime(month.year, month.month + 1, 0);
      query = query.or().reportDateBetween(month, lastDateOfMonth);
    });

    return query.findAll();
  }

  @override
  Future<void> upsert(Report report) async {
    await _database.writeTxn(() async {
      await _collection.putByIndex('reportDate', report);
    });
  }

  @override
  Future<void> deleteAll() async {
    await _database.writeTxn(() async {
      await _collection.clear();
    });
  }

  @override
  Future<void> delete(Id id) async {
    await _database.writeTxn(() async {
      await _collection.delete(id);
    });
  }
}
