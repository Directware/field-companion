import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.go(AppLocations.settings.href);
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background-map.jpeg"),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SafeArea(
              child: Column(
                children: [
                  TitleBar(
                    title: 'settings.aboutApp'.tr(),
                    trailing: SizedBox(
                      height: 30,
                      width: 90,
                      child: FilledButton.tonal(
                        onPressed: () {
                          // Navigator.pop(context);
                          context.go(AppLocations.settings.href);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ColorPalette.grey2Opacity30,
                          ),
                        ),
                        child: Text(
                          'common.done'.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  contributor('Idea & Devloper', 'Mateusz Klimentowicz'),
                  const SizedBox(
                    height: 40,
                  ),
                  contributor('Design & Text', 'Luca Vitello'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget shareApp() {
    return const Row();
  }

  Widget contributor(String role, String name) {
    return Column(
      children: [
        Text(
          role,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: ColorPalette.grey2,
          ),
        ),
      ],
    );
  }

  Widget footer() {
    return const Column(
      children: [
        Text(
          'Copyright © 2024 Mateusz Klimentowicz',
        ),
        Text(
          'All Rights Reserved',
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Field Companion v.1.1.0', // TODO - get version from pubspec.yaml
          style: TextStyle(
            color: ColorPalette.grey2,
          ),
        ),
        Text(
          'Made with love in Augsburg',
          style: TextStyle(
            color: ColorPalette.grey2,
          ),
        ),
      ],
    );
  }
}
