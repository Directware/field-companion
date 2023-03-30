import 'package:field_companion/common_widgets/report/report_stepper.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../common_widgets/report/custom_datePicker.dart';
import '../../../../common_widgets/report/date_picker.dart';
import '../../../../common_widgets/report/stats_header.dart';
import '../../../../common_widgets/title_bar.dart';

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
        StatsHeader(),
        const SizedBox(
          height: 50,
        ),
        MyDatePicker(),
        const ReportStepper(),
      ],
    );
  }
}
