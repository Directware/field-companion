import 'dart:ui';

import 'package:field_companion/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    required this.title,
    required this.icon,
    required this.value,
  });

  final String title;
  final IconData icon;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: ColorPalette.grey2,
          size: 18,
        ),
        const SizedBox(height: 9),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Heebo",
            fontSize: 16,
            height: 1.25,
            overflow: TextOverflow.ellipsis,
            fontVariations: [
              FontVariation("wght", 400),
            ],
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 80,
          decoration: BoxDecoration(
            color: ColorPalette.grey2Opacity24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    FeatherIcons.plus,
                    color: ColorPalette.grey2,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontFamily: "Heebo",
                  fontSize: 22,
                  fontVariations: [
                    FontVariation("wght", 500),
                  ],
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    FeatherIcons.minus,
                    color: ColorPalette.grey2,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
