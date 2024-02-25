import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';

class SectionItemStyles {
  const SectionItemStyles._();

  static const TextStyle _key = TextStyle(
    fontFamily: "Heebo",
    fontVariations: [
      FontVariation("wght", 400),
    ],
    letterSpacing: 0.4,
    height: 1.25,
  );

  static TextStyle whiteKey = _key.copyWith(color: Colors.white);

  static TextStyle blackKey = _key.copyWith(color: Colors.black);

  static TextStyle blueKey = _key.copyWith(color: ColorPalette.blue);

  static TextStyle redKey = _key.copyWith(color: ColorPalette.red);

  static TextStyle value = _key.copyWith(color: ColorPalette.grey2);

  static TextStyle valueBold = _key.copyWith(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
