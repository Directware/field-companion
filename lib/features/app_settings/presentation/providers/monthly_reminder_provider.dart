import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'monthly_reminder_provider.g.dart';

@riverpod
class MonthlyReminder extends _$MonthlyReminder {
  final sharedPreferenesKey = "MonthlyReminderProvider";

  late final SharedPreferences _preferences;

  @override
  Future<bool> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getBool(sharedPreferenesKey) ?? false;
  }

  void set(bool newValue) {
    state = AsyncValue.data(newValue);
    _preferences.setBool(sharedPreferenesKey, newValue);
  }
}
