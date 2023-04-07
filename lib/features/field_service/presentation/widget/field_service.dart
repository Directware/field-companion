import 'package:field_companion/common_widgets/report/date_picker.dart';
import 'package:field_companion/common_widgets/report/report_stepper.dart';
import 'package:field_companion/common_widgets/report/stats_header.dart';
import 'package:field_companion/common_widgets/title_bar.dart';
import 'package:flutter/material.dart';

class FieldService extends StatelessWidget {
  const FieldService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*
        TitleBar(
          title: 'month.3'.tr(),
        ),
        */
        const TitleBar(
          title: 'April 2023',
        ),
        // Temporary
        const StatsHeader(),
        const SizedBox(
          height: 50,
        ),
        MyDatePicker(),
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
