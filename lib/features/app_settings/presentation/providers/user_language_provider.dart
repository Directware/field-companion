import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_language_provider.g.dart';

@riverpod
class UserLanguage extends _$UserLanguage {
  final sharedPreferenesKey = "UserLanguage";

  late final SharedPreferences _preferences;

  @override
  Future<String> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getString(sharedPreferenesKey) ?? "en";
  }

  void set(String newValue) {
    state = AsyncValue.data(newValue);
    _preferences.setString(sharedPreferenesKey, newValue);
  }
}
