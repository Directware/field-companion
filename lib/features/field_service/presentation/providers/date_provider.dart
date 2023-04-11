import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_provider.g.dart';

@riverpod
class Date extends _$Date {
  late final StreamSubscription<int> _ticker;

  @override
  DateTime build() {
    _ticker = Stream.periodic(const Duration(seconds: 60), (count) => count)
        .listen((_) => state = DateTime.now());

    ref.onDispose(() => _ticker.cancel());

    return DateTime.now();
  }
}
