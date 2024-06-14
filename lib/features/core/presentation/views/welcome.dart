import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UiSpacing.spacingM + UiSpacing.spacingXs,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  key: Key("welcome:title"),
                  "title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                ).tr(),
                const SizedBox(height: UiSpacing.spacingXs),
                const Text(
                  key: Key("welcome:origin"),
                  "welcome.origin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
                const SizedBox(height: 85),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(24, 173, 177, 184),
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: const Icon(
                            color: Color(0xFFadb1b8),
                            size: 20,
                            FeatherIcons.clock,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: const Text(
                        "welcome.feature1",
                        style:
                            TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                      ).tr(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(24, 173, 177, 184),
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: const Icon(
                            color: Color(0xFFadb1b8),
                            size: 20,
                            FeatherIcons.award,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: const Text(
                        "welcome.feature2",
                        style:
                            TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                      ).tr(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(24, 173, 177, 184),
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: const Icon(
                            color: Color(0xFFadb1b8),
                            size: 20,
                            FeatherIcons.mail,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: const Text(
                        "welcome.feature3",
                        style:
                            TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                      ).tr(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(24, 173, 177, 184),
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: const Icon(
                            color: Color(0xFFadb1b8),
                            size: 20,
                            FeatherIcons.map,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: const Text(
                        "welcome.feature4",
                        style:
                            TextStyle(color: Color(0xFFadb1b8), fontSize: 18),
                      ).tr(),
                    ),
                  ],
                ),
                const SizedBox(height: 86),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(appInitialisationProvider.notifier).set();
                      ref
                          .read(userLanguageProvider.notifier)
                          .set(context.locale.languageCode);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xFF1E90FF),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: UiSpacing.spacingS,
                        ),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(borderRadius: UiSpacing.radiusM),
                      ),
                    ),
                    child: const Text(
                      "actions.continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ).tr(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
