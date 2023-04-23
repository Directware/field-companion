import 'dart:math' hide log;

import 'package:collection/collection.dart';
import 'package:field_companion/features/field_service/presentation/providers/tips/acknowledged_tips_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/tips/tips_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_tip_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentTip extends _$CurrentTip {
  late final int _index;
  late final List<String> _tipList;

  @override
  String? build() {
    _tipList = ref.watch(tipsProvider);
    return _pickNewTip();
  }

  void acknowledge() {
    state = null;
    ref.read(acknowledgedTipsProvider.notifier).acknowledge(_index);
  }

  void reset() {
    state = _pickNewTip();
  }

  String? _pickNewTip() {
    final acknowledgedTips = ref.read(acknowledgedTipsProvider);
    final tips = _tipList
        .whereIndexed((index, _) => !acknowledgedTips.contains(index))
        .toList();

    if (acknowledgedTips.length == _tipList.length) {
      return null;
    }

    final filteredIndex = Random().nextInt(tips.length);
    _index = _tipList.indexOf(tips[filteredIndex]);

    return tips[filteredIndex];
  }
}
