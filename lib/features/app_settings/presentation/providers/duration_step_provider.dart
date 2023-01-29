import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'duration_step_provider.g.dart';

@riverpod
class DurationStep extends _$DurationStep {
  final sharedPreferenesKey = "DurationStep";

  late final SharedPreferences _preferences;

  @override
  int build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getInt(sharedPreferenesKey) ?? 0;
  }

  void set(int newValue) {
    state = newValue;
    _preferences.setInt(sharedPreferenesKey, newValue);
  }
}
