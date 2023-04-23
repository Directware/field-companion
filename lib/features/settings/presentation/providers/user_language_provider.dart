import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_language_provider.g.dart';

@riverpod
class UserLanguage extends _$UserLanguage {
  final sharedPreferencesKey = "UserLanguage";

  late final SharedPreferences _preferences;

  @override
  String build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getString(sharedPreferencesKey) ?? "en";
  }

  void set(String newValue) {
    state = newValue;
    _preferences.setString(sharedPreferencesKey, newValue);
  }

  void reset() {
    state = "en";
    _preferences.setString(sharedPreferencesKey, "en");
  }
}
