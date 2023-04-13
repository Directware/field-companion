import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_month_provider.g.dart';

@riverpod
class SelectedMonth extends _$SelectedMonth {
  void next() {
    state = DateTime(state.year, state.month + 1);
  }

  void previous() {
    state = DateTime(state.year, state.month - 1);
  }

  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }
}
