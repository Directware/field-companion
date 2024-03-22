import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:flutter/material.dart';

class Contributor extends StatelessWidget {
  const Contributor({
    super.key,
    required this.role,
    required this.names,
  });

  final String role;
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          role,
          style: SectionItemStyles.valueBold,
        ),
        for (final name in names)
          Text(
            name,
            style: SectionItemStyles.value,
          ),
      ],
    );
  }
}
