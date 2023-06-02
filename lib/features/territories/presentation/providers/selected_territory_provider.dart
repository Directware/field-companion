import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_territory_provider.g.dart';

@riverpod
class SelectedTerritory extends _$SelectedTerritory {
  void set(Territory territory) {
    state = territory;
  }

  void reset(DateTime month) {
    state = null;
  }

  @override
  Territory? build() {
    return null;
  }
}
