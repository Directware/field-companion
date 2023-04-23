import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Tip extends StatelessWidget {
  const Tip({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: ColorPalette.grey2Opacity08,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "common.info",
                      style: TextStyle(
                        height: 1.25,
                        fontSize: 16,
                        letterSpacing: 0.4,
                        color: Colors.white,
                        fontFamily: "Heebo",
                        fontVariations: [
                          FontVariation("wght", 500),
                        ],
                      ),
                    ).tr(),
                    const SizedBox(height: 4),
                    Text(
                      text,
                      style: const TextStyle(
                        height: 1.25,
                        fontSize: 16,
                        letterSpacing: 0.4,
                        color: ColorPalette.grey2,
                        fontFamily: "Heebo",
                        fontVariations: [
                          FontVariation("wght", 400),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: InkWell(
              onTap: onTap,
              child: const Icon(FeatherIcons.x, color: ColorPalette.grey2),
            ),
          ),
        ],
      ),
    );
  }
}
