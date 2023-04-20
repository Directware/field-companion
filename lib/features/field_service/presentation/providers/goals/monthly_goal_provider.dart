import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'monthly_goal_provider.g.dart';

@riverpod
class MonthlyGoal extends _$MonthlyGoal {
  final sharedPreferencesKey = "MonthlyGoal";

  late final SharedPreferences _preferences;

  @override
  int build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getInt(sharedPreferencesKey) ?? 0;
  }

  void set(int newValue) {
    state = newValue;
    _preferences.setInt(sharedPreferencesKey, newValue);
  }
}
