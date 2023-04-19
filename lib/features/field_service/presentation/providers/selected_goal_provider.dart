import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_goal_provider.g.dart';

@riverpod
class SelectedGoal extends _$SelectedGoal {
  void toggle() {
    if (state == Goal.yearly) {
      state = Goal.monthly;
    } else {
      state = Goal.yearly;
    }
  }

  @override
  Goal build() {
    return Goal.monthly;
  }
}
