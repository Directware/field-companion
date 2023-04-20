import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/stepper_widget.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_report_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/year_studies_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/duration_step_provider.dart';
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
    if (studies != null) {
      ref
          .read(yearStudiesProvider.notifier)
          .update(DateTime(date.year, date.month), count: studies);
    } else {
      ref.read(reportsProvider.notifier).update(
            date,
            duration: duration,
            videos: videos,
            returnVisits: returnVisits,
            deliveries: deliveries,
          );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(selectedReportProvider);
    final durationStep = ref.watch(durationStepProvider);
    final date = ref.watch(selectedDateProvider);

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
                          step: durationStep,
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
