import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/number_picker.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/monthly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/yearly_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalBottomSheet extends ConsumerWidget {
  const GoalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yearlyGoal = ref.watch(yearlyGoalProvider);
    final monthlyGoal = ref.watch(monthlyGoalProvider);

    return Wrap(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ColorPalette.grey2Opacity08,
              ),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: ColorPalette.whiteOpacity10,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: NumberPicker(
                          title: 'service.monthly'.tr(),
                          value: monthlyGoal,
                          onChanged: (value) =>
                              ref.read(monthlyGoalProvider.notifier).set(value),
                        ),
                      ),
                      Expanded(
                        child: NumberPicker(
                          step: 5,
                          title: 'service.yearly'.tr(),
                          value: yearlyGoal,
                          onChanged: (value) =>
                              ref.read(yearlyGoalProvider.notifier).set(value),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
