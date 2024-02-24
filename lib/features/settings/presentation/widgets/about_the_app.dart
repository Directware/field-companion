import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

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
                  shareApp(),
                  const SizedBox(
                    height: 25,
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
    return GestureDetector(
      onTap: openShareSheet,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(79, 250, 106, 1),
                Color.fromRGBO(49, 225, 118, 1),
                Color.fromRGBO(23, 201, 125, 1),
              ],
            ),
          ),
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/icon-fc.png'),
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'You like our app?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Shar it with others!',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
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
    return Column(
      children: [
        const Text(
          'Copyright © 2024 Mateusz Klimentowicz',
        ),
        const Text(
          'All Rights Reserved',
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<String>(
          future: getAppVerion(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text(
                'Field Companion',
                style: TextStyle(
                  color: ColorPalette.grey2,
                ),
              );
            } else {
              if (snapshot.hasError) {
                return const Text(
                  'Field Companion',
                  style: TextStyle(
                    color: ColorPalette.grey2,
                  ),
                );
              } else {
                return Text(
                  'Field Companion v.${snapshot.data}',
                  style: const TextStyle(
                    color: ColorPalette.grey2,
                  ),
                );
              }
            }
          },
        ),
        const Text(
          'Made with love in Augsburg',
          style: TextStyle(
            color: ColorPalette.grey2,
          ),
        ),
      ],
    );
  }

  void openShareSheet() {
    const String url =
        'https://apps.apple.com/de/app/field-companion/id1513900519';
    Share.share(url);
  }

  Future<String> getAppVerion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }
}
