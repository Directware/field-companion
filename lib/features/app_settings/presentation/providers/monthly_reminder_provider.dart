import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'monthly_reminder_provider.g.dart';

@riverpod
class MonthlyReminder extends _$MonthlyReminder {
  final sharedPreferenesKey = "MonthlyReminderProvider";

  late final SharedPreferences _preferences;

  @override
  bool build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getBool(sharedPreferenesKey) ?? false;
  }

  void set(bool newValue) {
    state = newValue;
    _preferences.setBool(sharedPreferenesKey, newValue);
  }
}
