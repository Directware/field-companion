import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/common_widgets/date_picker.dart';
import 'package:field_companion/common_widgets/title_bar.dart';
import 'package:field_companion/features/field_service/presentation/providers/date_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report_stepper.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldService extends ConsumerWidget {
  const FieldService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final month = DateFormat('MMMM y').format(date);

    return Column(
      children: [
        TitleBar(
          title: month,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StatsHeader(),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: MyDatePicker(),
        ),
        const ReportStepper(
          time: 0.0,
          placements: 0,
          videos: 0,
          reVisits: 0,
        ),
      ],
    );
  }
}
