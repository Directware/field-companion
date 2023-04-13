import 'dart:ui';

import 'package:field_companion/common_widgets/report/progress_indicator.dart';
import 'package:field_companion/features/app_settings/presentation/providers/monthly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/total_duration_provider.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeProgress extends ConsumerWidget {
  const TimeProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(totalDurationProvider);
    final monthlyGoal = ref.watch(monthlyGoalProvider);
    final hours = (duration ~/ 60).toString();
    final minutes = (duration % 60).toString().padLeft(2, '0');
    final progress = monthlyGoal == 0 ? .0 : duration / monthlyGoal;

    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
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
                    500,
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
        ),
        ProgressIndicator(
          progress: progress,
        ),
      ],
    );
  }
}
