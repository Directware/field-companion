import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/stepper_widget.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportStepper extends ConsumerWidget {
  const ReportStepper({super.key});

  void _update(
    WidgetRef ref,
    DateTime? date, {
    int? duration,
    int? videos,
    int? returnVisits,
    int? deliveries,
    int? studies,
  }) {
    if (date == null) return;
    ref.read(reportsProvider.notifier).update(
          date,
          duration: duration,
          videos: videos,
          returnVisits: returnVisits,
          deliveries: deliveries,
          studies: studies,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(selectedReportProvider);
    final date = report?.reportDate;

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
                          title: 'service.duration'.tr(),
                          icon: FeatherIcons.clock,
                          value: report?.duration ?? 0,
                          step: 30,
                          timeFormat: true,
                          onChanged: (value) =>
                              _update(ref, date, duration: value),
                        ),
                      ),
                      Expanded(
                        child: StepperWidget(
                          title: 'service.deliveries'.tr(),
                          icon: FeatherIcons.bookOpen,
                          value: report?.deliveries ?? 0,
                          onChanged: (value) =>
                              _update(ref, date, deliveries: value),
                        ),
                      ),
                      Expanded(
                        child: StepperWidget(
                          title: 'service.videos'.tr(),
                          icon: FeatherIcons.playCircle,
                          value: report?.videos ?? 0,
                          onChanged: (value) =>
                              _update(ref, date, videos: value),
                        ),
                      ),
                      Expanded(
                        child: StepperWidget(
                          title: 'service.returnVisits'.tr(),
                          icon: FeatherIcons.refreshCcw,
                          value: report?.returnVisits ?? 0,
                          onChanged: (value) =>
                              _update(ref, date, returnVisits: value),
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
