import 'package:field_companion/features/core/presentation/providers/database_provider.dart';
import 'package:field_companion/features/territories/infrastructure/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'territory_repository_provider.g.dart';

@Riverpod(keepAlive: true)
TerritoryRepository territoryRepository(TerritoryRepositoryRef ref) {
  final database = ref.watch(databaseProvider);
  return TerritoryRepository(database);
}
