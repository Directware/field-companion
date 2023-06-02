import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoTerritoriesPlaceholder extends StatelessWidget {
  const NoTerritoriesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Material(
            color: ColorPalette.grey2Opacity24,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/territories-icon.svg',
                    semanticsLabel: 'Your SVG',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'territories.noTerritories'.tr(),
                    style: const TextStyle(
                      fontFamily: "Heebo",
                      fontSize: 16,
                      fontVariations: [
                        FontVariation("wght", 500),
                      ],
                      letterSpacing: 0.4,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 258,
                    child: Text(
                      'territories.noTerritoriesDesc'.tr(),
                      style: const TextStyle(
                        fontFamily: "Heebo",
                        color: ColorPalette.grey2,
                        fontSize: 16,
                        letterSpacing: 0.4,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
