import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/animated_number.dart';
import 'package:field_companion/features/core/presentation/widgets/common/progress_indicator.dart';
import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/progress_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/selected_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_duration_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/goals/goal_bottom_sheet.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeProgress extends ConsumerWidget {
  const TimeProgress({super.key});

  void _showGoalBottomSheet(BuildContext context, WidgetRef ref) {
    ref.read(selectedDateProvider.notifier).clear();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => const GoalBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyGoal = ref.watch(selectedGoalProvider) == Goal.monthly;
    final progress = ref.watch(progressProvider);
    final totalDuration = ref.watch(totalDurationProvider);

    return InkWell(
      onTap: () => ref.read(selectedGoalProvider.notifier).toggle(),
      onLongPress: () => _showGoalBottomSheet(context, ref),
      borderRadius: BorderRadius.circular(39),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedNumber(
              number: totalDuration,
              builder: (duration) {
                final hours = (duration ~/ 60).toString();
                final minutes = (duration % 60).toString().padLeft(2, '0');

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hours,
                      style: const TextStyle(
                        fontSize: 22,
                        letterSpacing: 0.21,
                        fontFamily: 'Heebo',
                        fontVariations: [
                          FontVariation(
                            "wght",
                            600,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      minutes,
                      style: const TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.11,
                        fontFamily: 'Heebo',
                        height: 1.82,
                        fontVariations: [
                          FontVariation(
                            "wght",
                            600,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            ProgressIndicator(
              progress: progress,
              startingColor: monthlyGoal
                  ? ColorPalette.greenProgressStart
                  : ColorPalette.blueProgressStart,
              shadowColor: monthlyGoal
                  ? ColorPalette.greenProgressStartOpacity05
                  : ColorPalette.blueProgressStartOpacity05,
              endingColor: monthlyGoal
                  ? ColorPalette.greenProgressEnd
                  : ColorPalette.blueProgressEnd,
              backgroundColor: ColorPalette.grey2Opacity30,
            ),
          ],
        ),
      ),
    );
  }
}
