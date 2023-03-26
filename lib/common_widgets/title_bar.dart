import 'dart:ui';

import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final String? backNavigationText;

  const TitleBar({
    super.key,
    required this.title,
    this.trailing,
    this.backNavigationText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Heebo",
                fontSize: 30,
                height: 1.2,
                fontVariations: [
                  FontVariation("wght", 500),
                ],
                letterSpacing: 0.4,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
