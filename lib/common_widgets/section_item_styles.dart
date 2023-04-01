import 'dart:ui';

import 'package:field_companion/color_palette.dart';
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

  static TextStyle blueKey = _key.copyWith(color: ColorPalette.blue);

  static TextStyle redKey = _key.copyWith(color: ColorPalette.red);

  static TextStyle value = _key.copyWith(color: ColorPalette.grey2);
}