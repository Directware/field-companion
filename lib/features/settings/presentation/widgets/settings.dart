import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/monthly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/goals/yearly_goal_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/year_studies_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/tips/acknowledged_tips_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/tips/current_tip_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/app_initialisation_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/confirmed_features_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/duration_step_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/monthly_reminder_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/user_language_provider.dart';
import 'package:field_companion/features/settings/presentation/widgets/picker_bottom_sheet.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  void _resetApp(WidgetRef ref, BuildContext context) {
    ref.read(reportsProvider.notifier).reset();
    ref.read(currentTipProvider.notifier).reset();
    ref.read(yearlyGoalProvider.notifier).reset();
    ref.read(territoriesProvider.notifier).reset();
    ref.read(yearStudiesProvider.notifier).reset();
    ref.read(monthlyGoalProvider.notifier).reset();
    ref.read(durationStepProvider.notifier).reset();
    ref.read(selectedDateProvider.notifier).clear();
    ref.read(monthlyReminderProvider.notifier).reset();
    ref.read(acknowledgedTipsProvider.notifier).reset();
    ref.read(appInitialisationProvider.notifier).reset();
    ref.read(confirmedFeaturesProvider.notifier).reset();
    ref.read(selectedMonthProvider.notifier).set(DateTime.now());

    context.resetLocale();
    ref.read(userLanguageProvider.notifier).set(context.locale.languageCode);
    ref.read(yearStudiesProvider.notifier).reset();
    ref.read(monthlyGoalProvider.notifier).reset();
  }

  Future<void> _createBackup(WidgetRef ref) async {
    final territories = ref.read(territoriesProvider);
    final reports = ref.read(reportsProvider);
    final yearlyGoal = ref.read(yearlyGoalProvider);
    final monthlyGoal = ref.read(monthlyGoalProvider);

    final fileContent = Map.of({
      "territories":
          territories.map((territory) => territory.toJson()).toList(),
      "reports": reports.map((report) => report.toJson()).toList(),
      "yearlyGoal": yearlyGoal,
      "monthlyGoal": monthlyGoal,
    });

    const backupFileName = "backup-fieldcompanion.gzfc";

    final encodedJson = utf8.encode(json.encode(fileContent));
    final gzipBytes = GZipEncoder().encode(encodedJson);

    if (gzipBytes == null) {
      return;
    }

    await Share.shareXFiles(
      [
        XFile.fromData(
          Uint8List.fromList(gzipBytes),
          mimeType: 'text/plain',
          name: backupFileName,
        ),
      ],
      fileNameOverrides: [backupFileName],
    );
  }

  Future<void> _importBackup(WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles();

    final file = result?.files.first;

    if (file == null || file.path == null || !file.path!.endsWith(".gzfc")) {
      return;
    }

    final bytes = File(file.path!).readAsBytesSync();
    final archive = GZipDecoder().decodeBytes(bytes, verify: true);
    final territoryData = utf8.decode(archive);
    final object = jsonDecode(territoryData) as Map<String, dynamic>;

    ref.read(territoriesProvider.notifier).reset();
    ref.read(reportsProvider.notifier).reset();
    ref.read(yearlyGoalProvider.notifier).reset();
    ref.read(monthlyGoalProvider.notifier).reset();

    final territories = object["territories"] as List<dynamic>;
    final reports = object["reports"] as List<dynamic>;
    final yearlyGoal = object["yearlyGoal"] as int;
    final monthlyGoal = object["monthlyGoal"] as int;

    ref.read(territoriesProvider.notifier).import(
          territories
              .map((e) => Territory.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

    ref.read(reportsProvider.notifier).import(
          reports
              .map((e) => Report.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

    ref.read(yearlyGoalProvider.notifier).set(yearlyGoal);
    ref.read(monthlyGoalProvider.notifier).set(monthlyGoal);
  }

  @override
  Widget build(BuildContext mainContext, WidgetRef ref) {
    final monthlyReminderValue = ref.watch(monthlyReminderProvider);
    final userLanguage = ref.watch(userLanguageProvider);
    final durationStep = ref.watch(durationStepProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleBar(
          title: 'settings.title'.tr(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Section(
                  title: 'settings.general'.tr(),
                  backgroundColor: ColorPalette.grey2Opacity08,
                  dividerColor: ColorPalette.grey2Opacity20,
                  children: [
                    SectionItem(
                      onTap: () {
                        showModalBottomSheet(
                          context: mainContext,
                          backgroundColor: Colors.transparent,
                          builder: (ctx) {
                            return PickerBottomSheet<String>(
                              selectValue: userLanguage,
                              items: [
                                SelectItem(
                                  label: 'settings.languages.de'.tr(),
                                  value: "de",
                                ),
                                SelectItem(
                                  label: 'settings.languages.en'.tr(),
                                  value: "en",
                                ),
                                SelectItem(
                                  label: 'settings.languages.pl'.tr(),
                                  value: "pl",
                                ),
                              ],
                              onSelected: (String language) {
                                ref
                                    .read(userLanguageProvider.notifier)
                                    .set(language);

                                mainContext.setLocale(Locale(language));
                              },
                            );
                          },
                        );
                      },
                      children: [
                        Text(
                          'settings.language',
                          style: SectionItemStyles.whiteKey,
                        ).tr(),
                        Text(
                          "settings.languages.$userLanguage".tr(),
                          style: SectionItemStyles.value,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Section(
                  title: 'settings.report'.tr(),
                  backgroundColor: ColorPalette.grey2Opacity08,
                  dividerColor: ColorPalette.grey2Opacity20,
                  children: [
                    SectionItem(
                      onTap: () {},
                      children: [
                        Text(
                          'settings.changeDurationStep',
                          style: SectionItemStyles.whiteKey,
                        ).tr(),
                        Text(
                          "$durationStep min",
                          style: SectionItemStyles.value,
                        ),
                      ],
                    ),
                    SectionItem(
                      onTap: () {},
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      children: [
                        Text(
                          'settings.monthlyReminder',
                          style: SectionItemStyles.whiteKey,
                        ).tr(),
                        CupertinoSwitch(
                          value: monthlyReminderValue,
                          onChanged: null,
                          // onChanged: (bool newValue) {
                          //   ref
                          //       .read(monthlyReminderProvider.notifier)
                          //       .set(value: newValue);
                          // },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Section(
                  title: 'settings.data'.tr(),
                  backgroundColor: ColorPalette.grey2Opacity08,
                  dividerColor: ColorPalette.grey2Opacity20,
                  children: [
                    SectionItem(
                      onTap: () => _createBackup(ref),
                      children: [
                        Text(
                          'settings.actions.exportBackup',
                          style: SectionItemStyles.blueKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.blue,
                          FeatherIcons.upload,
                          size: 20,
                        ),
                      ],
                    ),
                    SectionItem(
                      onTap: () => _importBackup(ref),
                      children: [
                        Text(
                          'settings.actions.importBackup',
                          style: SectionItemStyles.blueKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.blue,
                          FeatherIcons.download,
                          size: 20,
                        ),
                      ],
                    ),
                    SectionItem(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: ColorPalette.red,
                          context: mainContext,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(UiSpacing.spacingM),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _resetApp(ref, mainContext);
                                    },
                                    child: Text(
                                      tr('settings.actions.resetApp'),
                                      style: const TextStyle(
                                        color: ColorPalette.red,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      tr('common.cancel'),
                                      style: const TextStyle(
                                        color: ColorPalette.dark,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      children: [
                        Text(
                          'settings.actions.resetApp',
                          style: SectionItemStyles.redKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.red,
                          FeatherIcons.trash,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Section(
                  title: 'settings.app'.tr(),
                  backgroundColor: ColorPalette.grey2Opacity08,
                  dividerColor: ColorPalette.grey2Opacity20,
                  children: [
                    SectionItem(
                      onTap: () {
                        final mailtoURI = Uri(
                          scheme: 'mailto',
                          path: 'info@territory-offline.com',
                          queryParameters: {
                            'subject': 'Bug-Report',
                          },
                        );
                        _launchURL(mailtoURI);
                      },
                      children: [
                        Text(
                          'settings.actions.bugReport',
                          style: SectionItemStyles.blueKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.blue,
                          FeatherIcons.messageSquare,
                          size: 20,
                        ),
                      ],
                    ),
                    SectionItem(
                      onTap: () async {
                        final webSiteURI = Uri(
                          scheme: 'https',
                          host: 'territory-offline.com',
                        );
                        _launchURL(webSiteURI);
                      },
                      children: [
                        Text(
                          'settings.actions.territoryOffline',
                          style: SectionItemStyles.blueKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.blue,
                          FeatherIcons.externalLink,
                          size: 20,
                        ),
                      ],
                    ),
                    SectionItem(
                      onTap: () {
                        mainContext.go(AppLocations.settingsAboutApp.href);
                      },
                      children: [
                        Text(
                          'settings.actions.about',
                          style: SectionItemStyles.blueKey,
                        ).tr(),
                        const Icon(
                          color: ColorPalette.blue,
                          FeatherIcons.info,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
