import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/section_item_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openShareSheet,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorPalette.greenProgressEnd,
                ColorPalette.greenProgressStart,
                ColorPalette.green,
              ],
            ),
          ),
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/icon-fc.png'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'settings.share1'.tr(),
                        style: SectionItemStyles.blackKey,
                      ),
                      Text(
                        'settings.share2'.tr(),
                        style: SectionItemStyles.blackKey,
                      ),
                    ],
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(FeatherIcons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openShareSheet() {
    const String url =
        'https://apps.apple.com/de/app/field-companion/id1513900519';
    Share.share(url);
  }
}
