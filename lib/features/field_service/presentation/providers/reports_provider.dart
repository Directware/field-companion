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

  void update(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
    int? studies,
  }) {
    final index = state.indexWhere((report) => report.reportDate == date);
    final report = index >= 0
        ? state[index].clone(
            videos: videos,
            returnVisits: returnVisits,
            deliveries: deliveries,
            duration: duration,
            studies: studies,
          )
        : Report(
            reportDate: date,
            videos: videos ?? 0,
            returnVisits: returnVisits ?? 0,
            deliveries: deliveries ?? 0,
            duration: duration ?? 0,
            studies: studies ?? 0,
          );

    if (report.isEmpty()) {
      state = state.where((report) => report.reportDate != date).toList();
      _repository.delete(report.id);
    } else {
      if (index < 0) {
        state = [...state, report];
      } else {
        state = state
            .map((item) => item.reportDate == date ? report : item)
            .toList();
      }
      _repository.upsert(report);
    }
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
