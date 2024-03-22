import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_territory_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedTerritory extends _$SelectedTerritory {
  SelectedTerritory() : super();

// set territory(Territory territory) {
//     state = territory;
// }
  // ignore: use_setters_to_change_properties
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
