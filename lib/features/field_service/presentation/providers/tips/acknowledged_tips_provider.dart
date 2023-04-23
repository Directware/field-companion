import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'acknowledged_tips_provider.g.dart';

@riverpod
class AcknowledgedTips extends _$AcknowledgedTips {
  final sharedPreferencesKey = "AcknowledgedTips";

  late final SharedPreferences _preferences;

  @override
  Set<int> build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    final list = _preferences.getStringList(sharedPreferencesKey) ?? [];
    return list.map((i) => int.parse(i)).toSet();
  }

  void acknowledge(int tip) {
    state = {...state, tip};
    _update(state);
  }

  void reset() {
    state = {};
    _update(state);
  }

  void _update(Set<int> tips) {
    _preferences.setStringList(
      sharedPreferencesKey,
      tips.map((i) => i.toString()).toList(),
    );
  }
}
