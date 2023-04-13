import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'monthly_goal_provider.g.dart';

@riverpod
class MonthlyGoal extends _$MonthlyGoal {
  final sharedPreferenesKey = "MonthlyGoal";

  late final SharedPreferences _preferences;

  @override
  int build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getInt(sharedPreferenesKey) ?? 50 * 60;
  }

  void set(int newValue) {
    state = newValue;
    _preferences.setInt(sharedPreferenesKey, newValue);
  }
}
