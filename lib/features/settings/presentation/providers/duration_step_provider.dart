import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'duration_step_provider.g.dart';

@riverpod
class DurationStep extends _$DurationStep {
  final sharedPreferencesKey = "DurationStep";

  late final SharedPreferences _preferences;

  @override
  int build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getInt(sharedPreferencesKey) ?? 30;
  }

  void set(int newValue) {
    state = newValue;
    _preferences.setInt(sharedPreferencesKey, newValue);
  }

  void reset() {
    state = 30;
    _preferences.setInt(sharedPreferencesKey, 30);
  }
}
