import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_initialisation_provider.g.dart';

@riverpod
class AppInitialisation extends _$AppInitialisation {
  final sharedPreferenesKey = "AppInitialisationDone";

  late final SharedPreferences _preferences;

  @override
  Future<bool> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getBool(sharedPreferenesKey) ?? false;
  }

  void set() {
    state = const AsyncValue.data(true);
    _preferences.setBool(sharedPreferenesKey, true);
  }
}
