import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/settings/presentation/providers/app_initialisation_provider.dart';
import 'package:field_companion/features/settings/presentation/providers/user_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background-map.jpeg"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                key: Key("welcome:title"),
                "title",
                style: TextStyle(color: Colors.white, fontSize: 42),
              ).tr(),
              const SizedBox(height: 4),
              const Text(
                key: Key("welcome:origin"),
                "welcome.origin",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ).tr(),
              const SizedBox(height: 85),
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
                      color: Color(0xFFadb1b8),
                      size: 24,
                      FeatherIcons.clock,
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: const Text(
                      "welcome.feature1",
                      style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                    ).tr(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
                      color: Color(0xFFadb1b8),
                      size: 24,
                      FeatherIcons.award,
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: const Text(
                      "welcome.feature2",
                      style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                    ).tr(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
                      color: Color(0xFFadb1b8),
                      size: 24,
                      FeatherIcons.mail,
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: const Text(
                      "welcome.feature3",
                      style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                    ).tr(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
                      color: Color(0xFFadb1b8),
                      size: 24,
                      FeatherIcons.map,
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: const Text(
                      "welcome.feature4",
                      style: TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                    ).tr(),
                  ),
                ],
              ),
              const SizedBox(height: 86),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                    const Size.fromWidth(310),
                  ),
                ),
                onPressed: () {
                  ref.read(appInitialisationProvider.notifier).set();
                  ref.read(userLanguageProvider.notifier).set(context.locale.languageCode);
                },
                child: const Text("actions.continue").tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
