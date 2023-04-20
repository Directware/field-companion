import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/selected_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_month_duration_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_year_duration_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_duration_provider.g.dart';

@riverpod
int totalDuration(TotalDurationRef ref) {
  final selectedGoal = ref.watch(selectedGoalProvider);
  return selectedGoal == Goal.yearly
      ? ref.watch(totalYearDurationProvider)
      : ref.watch(totalMonthDurationProvider);
}
