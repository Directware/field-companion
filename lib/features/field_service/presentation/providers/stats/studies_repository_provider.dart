import 'package:field_companion/features/core/presentation/providers/database_provider.dart';
import 'package:field_companion/features/field_service/infrastructure/repositories/studies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'studies_repository_provider.g.dart';

@Riverpod(keepAlive: true)
StudiesRepository studiesRepository(StudiesRepositoryRef ref) {
  final database = ref.watch(databaseProvider);
  return StudiesRepository(database);
}
