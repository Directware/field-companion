import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/app_settings/presentation/providers/app_initialisation_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/device_id_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/duration_step_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/monthly_goal_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/monthly_reminder_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/user_language_provider.dart';
import 'package:field_companion/features/app_settings/presentation/providers/yearly_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        const Text("welcome.feature1").tr(),
        TextButton(
            onPressed: () => presscher(context, ref),
            child: const Text("actions.continue").tr())
      ],
    ));
  }

  void presscher(BuildContext context, WidgetRef ref) {
    final appInitialisationProv = ref.read(appInitialisationProvider.notifier);
    final deviceIdProv = ref.read(deviceIdProvider.notifier);
    final userLanguageProv = ref.read(userLanguageProvider.notifier);
    final durationStepProv = ref.read(durationStepProvider.notifier);
    final yearlyGoalProv = ref.read(yearlyGoalProvider.notifier);
    final monthlyGoalProv = ref.read(monthlyGoalProvider.notifier);
    final monthlyReminderProv = ref.read(monthlyReminderProvider.notifier);

    final id = customAlphabet(
        "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 36);

    appInitialisationProv.set();
    deviceIdProv.set(id);
    userLanguageProv.set(context.locale.languageCode);
    durationStepProv.set(30);
    yearlyGoalProv.set(0);
    monthlyGoalProv.set(0);
    monthlyReminderProv.set(false);
  }
}
