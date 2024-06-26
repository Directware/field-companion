import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:collection/collection.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/domain/models/visit_ban.dart';
import 'package:field_companion/features/territories/infrastructure/repositories/report_repository.dart';
import 'package:field_companion/features/territories/presentation/providers/territory_repository_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'territories_provider.g.dart';

@riverpod
class Territories extends _$Territories {
  late final TerritoryRepository _repository;

  void addVisitBan(String id, VisitBan visitBan) {
    final territory = state.firstWhereOrNull((territory) => territory.id == id);

    if (territory == null) return;

    final updatedTerritory =
        territory.clone(visitBans: [...territory.visitBans, visitBan]);

    state =
        state.map((item) => item.id == id ? updatedTerritory : item).toList();

    _repository.upsert(updatedTerritory);
  }

  void deleteVisitBan(String id, VisitBan visitBan) {
    final territory = state.firstWhereOrNull((territory) => territory.id == id);

    if (territory == null) return;

    final updatedTerritory = territory.clone(
      visitBans:
          territory.visitBans.where((item) => item.id != visitBan.id).toList(),
    );

    state =
        state.map((item) => item.id == id ? updatedTerritory : item).toList();

    _repository.upsert(updatedTerritory);
  }

  Future<void> add() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null && result?.paths[0] == null) return;

    final bytes = File(result!.paths[0]!).readAsBytesSync();
    final archive = GZipDecoder().decodeBytes(bytes, verify: true);
    final territoryData = utf8.decode(archive);
    final object = jsonDecode(territoryData) as Map<String, dynamic>;
    final territory = Territory.fromJson(object);

    state = [...state, territory];

    _repository.upsert(territory);
  }

  Future<void> delete(Territory territory) async {
    state = state.where((item) => item.id != territory.id).toList();
    _repository.delete(territory.id);
  }

  void reset() {
    state = [];
    _repository.deleteAll();
  }

  @override
  List<Territory> build() {
    _repository = ref.watch(territoryRepositoryProvider);

    _repository.getAll().then((territories) {
      state = territories;
    });

    return [];
  }
}
