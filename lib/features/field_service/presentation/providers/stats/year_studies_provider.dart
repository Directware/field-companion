import 'package:field_companion/features/field_service/domain/models/studies.dart';
import 'package:field_companion/features/field_service/infrastructure/repositories/studies_repository.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/studies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'year_studies_provider.g.dart';

@riverpod
class YearStudies extends _$YearStudies {
  late final StudiesRepository _repository;
  DateTime? _loadedYear;
  DateTime? _selectedMonth;

  Future<void> _fetch() async {
    final year = DateTime(_selectedMonth!.year);
    if (_selectedMonth == null ||
        DateTime(_selectedMonth!.year) == _loadedYear) {
      return;
    }

    state = await _repository.getByYear(year);
  }

  void update(
    DateTime month, {
    required int count,
  }) {
    final index = state.indexWhere((studies) => studies.month == month);
    final studies = index >= 0
        ? state[index].clone(
            count: count,
          )
        : Studies(
            month: month,
            count: count,
          );

    if (studies.isEmpty()) {
      state = state.where((studies) => studies.month != month).toList();
      _repository.delete(studies.id);
    } else {
      if (index < 0) {
        state = [...state, studies];
      } else {
        state =
            state.map((item) => item.month == month ? studies : item).toList();
      }
      _repository.upsert(studies);
    }
  }

  void reset() {
    state = [];
    _loadedYear = null;
    _repository.deleteAll();
  }

  @override
  List<Studies> build() {
    _repository = ref.watch(studiesRepositoryProvider);
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
