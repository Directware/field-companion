import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/stepper_widget.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/studies_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/year_studies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudiesBottomSheet extends ConsumerWidget {
  const StudiesBottomSheet({super.key});

  void _update(
    WidgetRef ref,
    int count,
  ) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    ref.read(yearStudiesProvider.notifier).update(selectedMonth, count: count);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studies = ref.watch(studiesProvider);

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
                        child: StepperWidget(
                          title: 'service.studies'.tr(),
                          icon: FeatherIcons.user,
                          value: studies,
                          onChanged: (value) => _update(ref, value),
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
