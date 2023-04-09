import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/report/stats_counter.dart';
import 'package:field_companion/common_widgets/report/time_progress.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 370,
          decoration: BoxDecoration(
            color: ColorPalette.grey2Opacity24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TimeProgress(
                progress: 75,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      children: const [
                        StatsCounter(
                          amount: 20,
                          icon: Icon(
                            FeatherIcons.bookOpen,
                            color: ColorPalette.grey2,
                            size: 20,
                          ),
                        ),
                        StatsCounter(
                          amount: 3,
                          icon: Icon(
                            FeatherIcons.refreshCw,
                            color: ColorPalette.grey2,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 16.0),
                    child: Column(
                      children: const [
                        StatsCounter(
                          amount: 0,
                          icon: Icon(
                            FeatherIcons.playCircle,
                            color: ColorPalette.grey2,
                            size: 20,
                          ),
                        ),
                        StatsCounter(
                          amount: 0,
                          icon: Icon(
                            FeatherIcons.user,
                            color: ColorPalette.grey2,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
