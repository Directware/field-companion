import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_date_provider.g.dart';

@riverpod
class SelectedDate extends _$SelectedDate {
  void set(DateTime date) {
    if (state == date) state = null;
    state = date;
  }

  @override
  DateTime? build() {
    return null;
  }
}
