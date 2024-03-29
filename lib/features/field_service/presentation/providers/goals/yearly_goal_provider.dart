import 'package:field_companion/features/core/infrastructure/models/debouncer.dart';
import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'yearly_goal_provider.g.dart';

@riverpod
class YearlyGoal extends _$YearlyGoal {
  final sharedPreferencesKey = "YearlyGoal";

  late final SharedPreferences _preferences;
  final debouncer = Debouncer(delay: const Duration(milliseconds: 300));

  @override
  int build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getInt(sharedPreferencesKey) ?? 0;
  }

  void set(int newValue) {
    state = newValue;
    debouncer.run(() => _preferences.setInt(sharedPreferencesKey, newValue));
  }

  void reset() {
    state = 0;
    _preferences.setInt(sharedPreferencesKey, 0);
  }
}
