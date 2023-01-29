import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'confirmed_features_provider.g.dart';

@riverpod
class ConfirmedFeatures extends _$ConfirmedFeatures {
  final sharedPreferenesKey = "ConfirmedFeatures";

  late final SharedPreferences _preferences;

  @override
  List<String> build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getStringList(sharedPreferenesKey) ?? [];
  }

  void set(String confirmedFeatureName) {
    final currentValue = state;
    final newValue = [...currentValue, confirmedFeatureName];

    state = newValue;
    _preferences.setStringList(sharedPreferenesKey, newValue);
  }
}
