import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/monthly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/yearly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/selected_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_duration_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_provider.g.dart';

@riverpod
double progress(ProgressRef ref) {
  final selectedGoal = ref.watch(selectedGoalProvider);
  final duration = ref.watch(totalDurationProvider);
  final goal = selectedGoal == Goal.yearly
      ? ref.watch(yearlyGoalProvider)
      : ref.watch(monthlyGoalProvider);
  return goal == 0 ? 1 : duration / (goal * 60);
}
