import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/domain/repositories/report_repository_interface.dart';
import 'package:isar/isar.dart';

class ReportRepository implements ReportRepositoryInterface {
  ReportRepository(this._database) {
    _collection = _database.reports;
  }

  final Isar _database;
  late final IsarCollection<Report> _collection;

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
