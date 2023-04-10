import 'dart:ui';

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
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: ColoredBox(
              color: ColorPalette.grey2Opacity24,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const TimeProgress(
                    progress: 80,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: StatsCounter(
                                  amount: 23,
                                  icon: FeatherIcons.bookOpen,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: StatsCounter(
                                  amount: 9,
                                  icon: FeatherIcons.playCircle,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Expanded(
                                child: StatsCounter(
                                  amount: 12,
                                  icon: FeatherIcons.refreshCw,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: StatsCounter(
                                  amount: 3,
                                  icon: FeatherIcons.user,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
