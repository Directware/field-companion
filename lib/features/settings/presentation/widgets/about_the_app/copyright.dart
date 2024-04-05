import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Copyright © 2024 Mateusz Klimentowicz',
          style: SectionItemStyles.whiteKey,
        ),
        Text(
          'All Rights Reserved',
          style: SectionItemStyles.whiteKey,
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<String>(
          future: getAppVersion(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                'Field Companion',
                style: SectionItemStyles.value,
              );
            } else {
              if (snapshot.hasError) {
                return Text(
                  'Field Companion',
                  style: SectionItemStyles.value,
                );
              } else {
                return Text(
                  'Field Companion v.${snapshot.data}',
                  style: SectionItemStyles.value,
                );
              }
            }
          },
        ),
        Text(
          'Made with love in Augsburg',
          style: SectionItemStyles.value,
        ),
      ],
    );
  }

  Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }
}
