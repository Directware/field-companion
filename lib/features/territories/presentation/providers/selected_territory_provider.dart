import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_territory_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedTerritory extends _$SelectedTerritory {
  String? id;

  // ignore: use_setters_to_change_properties
  void set(Territory? territory) {
    id = territory?.id;
    state = territory;
  }

  void reset() {
    id = null;
    state = null;
  }

  @override
  Territory? build() {
    final territories = ref.watch(territoriesProvider);

    if (id == null || territories.isEmpty) {
      return null;
    }

    return territories.where((element) => element.id == id).firstOrNull;
  }
}
