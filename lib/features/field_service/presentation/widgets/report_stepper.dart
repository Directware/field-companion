import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportStepper extends ConsumerWidget {
  const ReportStepper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPalette.grey2Opacity08,
            ),
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: ColorPalette.grey2Opacity30,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepperWidget(
                      title: 'service.duration'.tr(),
                      icon: const Icon(
                        FeatherIcons.clock,
                        color: Colors.white,
                      ),
                    ),
                    StepperWidget(
                      title: 'service.deliveries'.tr(),
                      icon: const Icon(
                        FeatherIcons.bookOpen,
                        color: Colors.white,
                      ),
                    ),
                    StepperWidget(
                      title: 'service.videos'.tr(),
                      icon: const Icon(
                        FeatherIcons.playCircle,
                        color: Colors.white,
                      ),
                    ),
                    StepperWidget(
                      title: 'service.returnVisits'.tr(),
                      icon: const Icon(
                        FeatherIcons.refreshCcw,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
