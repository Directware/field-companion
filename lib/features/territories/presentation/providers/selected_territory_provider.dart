import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_territory_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedTerritory extends _$SelectedTerritory {
  // ignore: use_setters_to_change_properties
  void set(Territory? territory) {
    state = territory;
  }

  void reset() {
    state = null;
  }

  @override
  Territory? build() {
    return null;
  }
}
