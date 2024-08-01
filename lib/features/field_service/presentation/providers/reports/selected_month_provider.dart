import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_month_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedMonth extends _$SelectedMonth {
  void set(DateTime month) {
    state = DateTime(month.year, month.month);
  }

  void reset(DateTime month) {
    set(DateTime.now());
  }

  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }
}
