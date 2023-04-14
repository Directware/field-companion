import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_month_provider.g.dart';

@riverpod
class SelectedMonth extends _$SelectedMonth {
  void set(DateTime month) {
    log("month $month");
    state = DateTime(month.year, month.month);
  }

  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }
}
