import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    this.title,
    this.backgroundColor,
    this.dividerColor,
    required this.children,
  });

  final String? title;
  final Color? backgroundColor;
  final Color? dividerColor;
  final List<SectionItem> children;

  @override
  Widget build(BuildContext context) {
    final childWithSeparators = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      childWithSeparators.add(children[i]);
      if (i < children.length - 1) {
        childWithSeparators.add(
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child:
                Divider(height: 1, color: dividerColor ?? Colors.transparent),
          ),
        );
      }
    }

    childWithSeparators.add(
      Divider(height: 1, color: dividerColor ?? Colors.transparent),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title!,
              style: const TextStyle(
                color: ColorPalette.grey2,
              ),
            ),
          ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Material(
              color: backgroundColor ?? Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: childWithSeparators,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
