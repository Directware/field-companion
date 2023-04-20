import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/studies_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_deliveries_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_return_visits_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/stats/total_videos_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/stats_counter.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/time_progress.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsHeader extends ConsumerWidget {
  const StatsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(totalVideosProvider);
    final studies = ref.watch(studiesProvider);
    final deliveries = ref.watch(totalDeliveriesProvider);
    final returnVisits = ref.watch(totalReturnVisitsProvider);

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Material(
              color: ColorPalette.grey2Opacity24,
              child: Row(
                children: [
                  const SizedBox(width: 17),
                  const TimeProgress(),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: StatsCounter(
                                  value: deliveries,
                                  icon: FeatherIcons.bookOpen,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: StatsCounter(
                                  value: videos,
                                  icon: FeatherIcons.playCircle,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: StatsCounter(
                                  value: returnVisits,
                                  icon: FeatherIcons.refreshCw,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: StatsCounter(
                                  value: studies,
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
