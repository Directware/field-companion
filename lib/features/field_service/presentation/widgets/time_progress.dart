import 'dart:ui';

import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/animated_number.dart';
import 'package:field_companion/common_widgets/progress_indicator.dart';
import 'package:field_companion/features/field_service/presentation/models/goal.dart';
import 'package:field_companion/features/field_service/presentation/providers/progress_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/total_duration_provider.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeProgress extends ConsumerWidget {
  const TimeProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyGoal = ref.watch(selectedGoalProvider) == Goal.monthly;
    final progress = ref.watch(progressProvider);
    final totalDuration = ref.watch(totalDurationProvider);

    return InkWell(
      onTap: () => ref.read(selectedGoalProvider.notifier).toggle(),
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
