
import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';

class FieldServiceMenu extends StatelessWidget {
  const FieldServiceMenu({
    super.key,
    required this.items,
    required this.onMenuItemTap,
  });

  final List<String> items;
  final ValueChanged<String> onMenuItemTap;

  List<Widget> _getChildren() {
    final List<Widget> children = [];
    for (var index = 0; index < items.length; index++) {
      final first = index == 0;
      final last = index == items.length - 1;
      children.add(
        InkWell(
          onTap: () => onMenuItemTap(items[index]),
          borderRadius: BorderRadius.only(
            topLeft: first ? const Radius.circular(16) : Radius.zero,
            topRight: first ? const Radius.circular(16) : Radius.zero,
            bottomLeft: last ? const Radius.circular(16) : Radius.zero,
            bottomRight: last ? const Radius.circular(16) : Radius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              items[index].tr(),
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.4,
                fontFamily: 'Heebo',
                fontVariations: [FontVariation("wght", 400)],
              ),
            ),
          ),
        ),
      );
      if (!last) {
        children.add(
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Divider(height: 1, color: ColorPalette.grey2Opacity20),
          ),
        );
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: 270,
          child: Material(
            color: ColorPalette.darkGrey,
            borderRadius: BorderRadius.circular(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getChildren(),
            ),
          ),
        ),
      ],
    );
  }
}
