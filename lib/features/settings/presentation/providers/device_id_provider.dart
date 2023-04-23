import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'device_id_provider.g.dart';

@Riverpod(keepAlive: true)
class DeviceId extends _$DeviceId {
  final sharedPreferenesKey = "DeviceId";

  late final SharedPreferences _preferences;

  @override
  String build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getString(sharedPreferenesKey) ?? generateDeviceId();
  }

  void set(String newValue) {
    state = newValue;
    _preferences.setString(sharedPreferenesKey, newValue);
  }

  String generateDeviceId() {
    const alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final id =
        "${customAlphabet(alphabet, 8)}-${customAlphabet(alphabet, 4)}-${customAlphabet(alphabet, 4)}-${customAlphabet(alphabet, 4)}-${customAlphabet(alphabet, 12)}";
    _preferences.setString(sharedPreferenesKey, id);
    return id;
  }
}
