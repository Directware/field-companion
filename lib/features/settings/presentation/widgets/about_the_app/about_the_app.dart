import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/settings/presentation/widgets/about_the_app/contributer_widget.dart';
import 'package:field_companion/features/settings/presentation/widgets/about_the_app/copyright.dart';
import 'package:field_companion/features/settings/presentation/widgets/about_the_app/share_app.dart';
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
                          style: SectionItemStyles.whiteKey,
                        ),
                      ),
                    ),
                  ),
                  const ShareApp(),
                  const SizedBox(
                    height: 25,
                  ),
                  Contributor(
                    role: 'settings.appIdea'.tr(),
                    names: const ['Mateusz Klimentowicz'],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Contributor(
                    role: 'settings.appDesign'.tr(),
                    names: const ['Luca Vitello'],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Copyright(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
