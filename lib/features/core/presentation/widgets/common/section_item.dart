import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    this.backgroudColor,
    this.padding,
    this.onTap,
    required this.children,
  });

  final Color? backgroudColor;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }
}
