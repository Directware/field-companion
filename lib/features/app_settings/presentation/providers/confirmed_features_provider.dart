import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'confirmed_features_provider.g.dart';

@riverpod
class ConfirmedFeatures extends _$ConfirmedFeatures {
  final sharedPreferenesKey = "ConfirmedFeatures";

  late final SharedPreferences _preferences;

  @override
  Future<List<String>> build() async {
    _preferences = await ref.watch(sharedPreferencesProvider.future);
    return _preferences.getStringList(sharedPreferenesKey) ?? [];
  }

  void set(String confirmedFeatureName) async {
    final currentValue = state.value ?? [];
    final newValue = [...currentValue, confirmedFeatureName];

    state = AsyncValue.data(newValue);
    _preferences.setStringList(sharedPreferenesKey, newValue);
  }
}
