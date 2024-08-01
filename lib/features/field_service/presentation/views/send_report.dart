import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/year_studies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class SendReport extends ConsumerWidget {
  const SendReport({super.key});

  Widget _informationRow(String key, Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiSpacing.spacingS,
        vertical: UiSpacing.spacingXs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Heebo',
              fontSize: 16,
            ),
          ),
          widget,
        ],
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Heebo',
      ),
    );
  }

  String _printDuration(Duration duration) {
    final String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString();

    final String twoDigitMinutes =
        twoDigits(duration.inMinutes.remainder(60).abs());

    if (twoDigitMinutes == "0") {
      return "$negativeSign${twoDigits(duration.inHours)}h";
    }

    return "$negativeSign${twoDigits(duration.inHours)}h $twoDigitMinutes min";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final lastMonth = DateTime(now.year, now.month - 1);
    final String lastMonthName = DateFormat("MMMM yyyy").format(lastMonth);

    final relevantReports = ref
        .watch(reportsProvider.notifier)
        .reportsByMonth(lastMonth.month, lastMonth.year);

    final duration = relevantReports.fold<int>(
      0,
      (previousValue, element) => previousValue + element.duration,
    );

    final durationAddition =
        (duration / 60) % 1 == 0 ? "" : "(-> ${(duration / 60).ceil()}h)";

    final deliveries = relevantReports.fold<int>(
      0,
      (previousValue, element) => previousValue + element.deliveries,
    );

    final videos = relevantReports.fold<int>(
      0,
      (previousValue, element) => previousValue + element.videos,
    );

    final returnVisits = relevantReports.fold<int>(
      0,
      (previousValue, element) => previousValue + element.returnVisits,
    );

    final studies = ref
            .read(yearStudiesProvider)
            .where(
              (studies) =>
                  studies.month.year == lastMonth.year &&
                  studies.month.month == lastMonth.month,
            )
            .firstOrNull
            ?.count ??
        0;

    return Wrap(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ColorPalette.grey2Opacity08,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiSpacing.spacingS,
                  vertical: UiSpacing.spacingS,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr("service.sendReport"),
                          style: const TextStyle(
                            fontFamily: "Heebo",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                horizontal: UiSpacing.spacingS,
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              ColorPalette.grey2Opacity30,
                            ),
                            foregroundColor: WidgetStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          child: Text(
                            tr("common.done"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: UiSpacing.spacingS),
                    Container(
                      padding: const EdgeInsets.only(
                        top: UiSpacing.spacingS,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.19),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: UiSpacing.spacingS,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  lastMonthName,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Heebo',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(tr("service.serviceDoneCheck")),
                                    const SizedBox(width: UiSpacing.spacingXs),
                                    const Icon(
                                      FeatherIcons.checkCircle,
                                      color: ColorPalette.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: UiSpacing.spacingS),
                          _informationRow(
                            'service.duration'.tr(),
                            _text(
                              "${_printDuration(Duration(minutes: duration))} $durationAddition",
                            ),
                          ),
                          _informationRow(
                            'service.deliveries'.tr(),
                            _text("$deliveries"),
                          ),
                          _informationRow(
                            'service.videos'.tr(),
                            _text("$videos"),
                          ),
                          _informationRow(
                            'service.returnVisits'.tr(),
                            _text("$returnVisits"),
                          ),
                          _informationRow(
                            'service.studies'.tr(),
                            _text("$studies"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: UiSpacing.spacingXs),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          String text =
                              "$lastMonthName: ${tr("service.serviceDoneCheck")}\n";

                          if (duration > 0) {
                            final dur = (duration / 60).ceil();
                            text += "\n${tr("service.duration")}: $dur";
                          }

                          if (deliveries > 0) {
                            text +=
                                "\n${tr("service.deliveries")}: $deliveries";
                          }

                          if (videos > 0) {
                            text += "\n${tr("service.videos")}: $videos";
                          }

                          if (returnVisits > 0) {
                            text +=
                                "\n${tr("service.returnVisits")}: $returnVisits";
                          }

                          if (studies > 0) {
                            text += "\n${tr("service.studies")}: $studies";
                          }

                          await Share.share(text);

                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            ColorPalette.blue,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: Text(tr("actions.send")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
