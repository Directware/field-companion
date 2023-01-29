import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'monthly_goal_provider.g.dart';

@riverpod
class MonthlyGoal extends _$MonthlyGoal {
  final sharedPreferenesKey = "MonthlyGoal";

  late final SharedPreferences _preferences;

  @override
  Future<int> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getInt(sharedPreferenesKey) ?? 0;
  }

  void set(int newValue) {
    state = AsyncValue.data(newValue);
    _preferences.setInt(sharedPreferenesKey, newValue);
  }
}
