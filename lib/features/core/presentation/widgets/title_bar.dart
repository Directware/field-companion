import 'dart:ui';

import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
    this.title,
    this.trailing,
    this.backNavigationText,
    this.onTap,
  });

  final String? title;
  final Widget? trailing;
  final String? backNavigationText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 10.0, top: 26, right: 16, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        title!,
                        style: const TextStyle(
                          fontFamily: "Heebo",
                          fontSize: 30,
                          fontVariations: [
                            FontVariation("wght", 500),
                          ],
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
