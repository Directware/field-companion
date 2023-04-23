import 'package:collection/collection.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/year_studies_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'studies_provider.g.dart';

@riverpod
int studies(StudiesRef ref) {
  final selectedMonth = ref.watch(selectedMonthProvider);
  final studies = ref.watch(yearStudiesProvider);
  return studies
          .firstWhereOrNull(
            (studies) =>
                studies.month.year == selectedMonth.year &&
                studies.month.month == selectedMonth.month,
          )
          ?.count ??
      0;
}
