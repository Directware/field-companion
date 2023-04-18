import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/infrastructure/repositories/report_repository.dart';
import 'package:field_companion/features/field_service/presentation/providers/report_repository_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_month_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports_provider.g.dart';

@riverpod
class Reports extends _$Reports {
  late final ReportRepository _repository;
  late Set<DateTime> loaded = {};

  Future<void> _fetch(DateTime selectedMonth) async {
    final months = {
      for (var index = -1; index <= 1; index++)
        DateTime(selectedMonth.year, selectedMonth.month + index)
    };

    final loadMonths =
        months.where((month) => !loaded.contains(month)).toList();

    state = await _repository.getByMonths(loadMonths).then(
      (reports) {
        loaded = months;

        return [
          ...reports,
          ...state.where((report) => _monthsIncludeDate(report.reportDate))
        ];
      },
    );
  }

  bool _monthsIncludeDate(DateTime date) {
    for (final month in loaded) {
      if (month.year == date.year && month.month == date.month) return true;
    }
    return false;
  }

  @override
  List<Report> build() {
    _repository = ref.watch(reportRepositoryProvider);
    ref.listen(
      selectedMonthProvider,
      (_, next) => _fetch(next),
      fireImmediately: true,
    );

    return [];
  }
}
