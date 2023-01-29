import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'device_id_provider.g.dart';

@riverpod
class DeviceId extends _$DeviceId {
  final sharedPreferenesKey = "DeviceId";

  late final SharedPreferences _preferences;

  @override
  Future<String> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getString(sharedPreferenesKey) ?? "-";
  }

  void set(String newValue) {
    state = AsyncValue.data(newValue);
    _preferences.setString(sharedPreferenesKey, newValue);
  }
}
