import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'confirmed_features_provider.g.dart';

@riverpod
class ConfirmedFeatures extends _$ConfirmedFeatures {
  final sharedPreferencesKey = "ConfirmedFeatures";

  late final SharedPreferences _preferences;

  @override
  List<String> build() {
    _preferences = ref.watch(sharedPreferencesProvider);
    return _preferences.getStringList(sharedPreferencesKey) ?? [];
  }

  void set(String confirmedFeatureName) {
    final currentValue = state;
    final newValue = [...currentValue, confirmedFeatureName];

    state = newValue;
    _preferences.setStringList(sharedPreferencesKey, newValue);
  }

  void reset() {
    state = [];
    _preferences.setStringList(sharedPreferencesKey, []);
  }
}
