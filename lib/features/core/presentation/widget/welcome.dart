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
import 'package:logger/logger.dart';
import 'package:nanoid/nanoid.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      const Positioned.fill(
          child: Image(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/background-map.jpeg"),
      )),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            key: Key("welcome:title"),
            "title",
            style: TextStyle(color: Colors.white, fontSize: 42),
          ).tr(),
          Container(
            height: 4,
          ),
          const Text(
            key: Key("welcome:origin"),
            "welcome.origin",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ).tr(),
          Container(
            height: 85,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(24, 173, 177, 184),
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: const Icon(
                      color: Color(0xFFadb1b8), size: 24, FeatherIcons.clock)
                  // ,
                  ),
              Container(
                  width: 240,
                  child: Text(
                    "welcome.feature1",
                    style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                  ).tr())
            ],
          ),
          Container(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(24, 173, 177, 184),
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Icon(
                      color: Color(0xFFadb1b8), size: 24, FeatherIcons.award)
                  // ,
                  ),
              Container(
                  width: 240,
                  child: const Text(
                    "welcome.feature2",
                    style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                  ).tr())
            ],
          ),
          Container(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(24, 173, 177, 184),
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Icon(
                      color: Color(0xFFadb1b8), size: 24, FeatherIcons.mail)
                  // ,
                  ),
              Container(
                  width: 240,
                  child: const Text(
                    "welcome.feature3",
                    style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                  ).tr())
            ],
          ),
          Container(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(24, 173, 177, 184),
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Icon(
                      color: Color(0xFFadb1b8), size: 24, FeatherIcons.map)),
              Container(
                  width: 240,
                  child: const Text(
                    "welcome.feature4",
                    style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                  ).tr())
            ],
          ),
          Container(
            height: 86,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(310))),
              onPressed: () => initializeFieldCompanion(context, ref),
              child: const Text("actions.continue").tr())
        ],
      )
    ]));
  }

  void initializeFieldCompanion(BuildContext context, WidgetRef ref) {
    Logger().d("Initilize Field Companion");

    final appInitialisationProv = ref.read(appInitialisationProvider.notifier);
    final deviceIdProv = ref.read(deviceIdProvider.notifier);
    final userLanguageProv = ref.read(userLanguageProvider.notifier);
    final durationStepProv = ref.read(durationStepProvider.notifier);
    final yearlyGoalProv = ref.read(yearlyGoalProvider.notifier);
    final monthlyGoalProv = ref.read(monthlyGoalProvider.notifier);
    final monthlyReminderProv = ref.read(monthlyReminderProvider.notifier);

    final id = customAlphabet(
        "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 36);

    Logger().i({"deviceId": id, "language": context.locale.languageCode},
        "Initilize Field Companion");
    // appInitialisationProv.set();
    // deviceIdProv.set(id);
    // userLanguageProv.set(context.locale.languageCode);
    // durationStepProv.set(30);
    // yearlyGoalProv.set(0);
    // monthlyGoalProv.set(0);
    // monthlyReminderProv.set(false);
  }
}
