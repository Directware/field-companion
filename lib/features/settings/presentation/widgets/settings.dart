import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
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
import 'package:field_companion/features/settings/presentation/providers/device_id_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/duration_step_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/monthly_reminder_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/user_language_provider.dart';
import 'package:field_companion/features/settings/presentation/widgets/picker_bottom_sheet.dart';
import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  void _resetApp(WidgetRef ref, BuildContext context) {
    ref.read(appInitialisationProvider.notifier).reset();
    ref.read(confirmedFeaturesProvider.notifier).reset();
    ref.read(durationStepProvider.notifier).reset();
    ref.read(monthlyReminderProvider.notifier).reset();
    ref.read(monthlyGoalProvider.notifier).reset();
    ref.read(yearlyGoalProvider.notifier).reset();
    ref.read(reportsProvider.notifier).reset();
    ref.read(yearStudiesProvider.notifier).reset();
    ref.read(selectedDateProvider.notifier).clear();
    ref.read(acknowledgedTipsProvider.notifier).reset();
    ref.read(currentTipProvider.notifier).reset();
    ref.read(selectedMonthProvider.notifier).set(DateTime.now());

    context.resetLocale();
    ref.read(userLanguageProvider.notifier).set(context.locale.languageCode);
  }

  @override
  Widget build(BuildContext mainContext, WidgetRef ref) {
    final monthlyReminderValue = ref.watch(monthlyReminderProvider);
    final deviceId = ref.watch(deviceIdProvider);
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
                    SectionItem(
                      onTap: () {},
                      children: [
                        Text(
                          'settings.yourId',
                          style: SectionItemStyles.whiteKey,
                        ).tr(),
                        SizedBox(
                          width: 120,
                          child: Text(
                            deviceId,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: SectionItemStyles.value,
                          ),
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
                          onChanged: (bool newValue) {
                            ref
                                .read(monthlyReminderProvider.notifier)
                                .set(value: newValue);
                          },
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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () => _resetApp(ref, mainContext),
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
                            'subject': 'Bug Report - Field Companion',
                          },
                        );
                        try {
                          _launchURL(mailtoURI);
                        } catch (e) {
                          // maybe show error alert
                        }
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
}
