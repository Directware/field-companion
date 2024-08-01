import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/infrastructure/repositories/report_repository.dart';
import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/report_repository_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/selected_goal_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports_provider.g.dart';

@Riverpod(keepAlive: true)
class Reports extends _$Reports {
  late final ReportRepository _repository;
  late Set<DateTime> _loaded = {};
  DateTime? _selectedMonth;
  Goal? _selectedGoal;

  Future<void> _fetch() async {
    if (_selectedMonth == null || _selectedGoal == null) return;

    final months = {
      if (_selectedGoal == Goal.yearly) ..._getMonthsOfYear(_selectedMonth!),
      for (var index = -1; index <= 1; index++)
        DateTime(_selectedMonth!.year, _selectedMonth!.month + index),
    };

    final loadMonths =
        months.where((month) => !_loaded.contains(month)).toList();

    state = await _repository.getByMonths(loadMonths).then(
      (reports) {
        _loaded = months;

        return [
          ...reports,
          ...state.where((report) => _monthsIncludeDate(report.reportDate)),
        ];
      },
    );
  }

  List<DateTime> _getMonthsOfYear(DateTime date) {
    final firstMonth =
        date.month >= 9 ? DateTime(date.year, 9) : DateTime(date.year - 1, 9);
    return [
      for (var month = 0; month < 12; month++)
        DateTime(firstMonth.year, firstMonth.month + month - 1),
    ];
  }

  bool _monthsIncludeDate(DateTime date) {
    for (final month in _loaded) {
      if (month.year == date.year && month.month == date.month) return true;
    }
    return false;
  }

  void import(List<Report> reports) {
    state = [...state, ...reports];

    for (final report in reports) {
      _repository.upsert(report);
    }
  }

  void update(
    DateTime date, {
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? duration,
  }) {
    final index = state.indexWhere((report) => report.reportDate == date);
    final report = index >= 0
        ? state[index].clone(
            videos: videos,
            returnVisits: returnVisits,
            deliveries: deliveries,
            duration: duration,
          )
        : Report(
            reportDate: date,
            videos: videos ?? 0,
            returnVisits: returnVisits ?? 0,
            deliveries: deliveries ?? 0,
            duration: duration ?? 0,
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

  void reset() {
    state = [];
    _loaded = {};
    _repository.deleteAll();
  }

  @override
  List<Report> build() {
    _repository = ref.watch(reportRepositoryProvider);
    ref.listen(
      selectedGoalProvider,
      (_, selectedGoal) {
        _selectedGoal = selectedGoal;
        _fetch();
      },
      fireImmediately: true,
    );
    ref.listen(
      selectedMonthProvider,
      (_, selectedMonth) {
        _selectedMonth = selectedMonth;
        _fetch();
      },
      fireImmediately: true,
    );

    return [];
  }
}
