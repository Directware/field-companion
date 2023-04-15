import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/common_widgets/calendar/calendar.dart';
import 'package:field_companion/common_widgets/title_bar.dart';
import 'package:field_companion/features/field_service/presentation/providers/days_of_reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldService extends ConsumerWidget {
  const FieldService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateTime.now();
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final initialMonth = DateTime(date.year, date.month);
    final month = DateFormat('MMMM y').format(selectedMonth);

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Calendar(
              initialMonth: initialMonth,
              selectedDate: selectedDate,
              highlightedBuilder: (month) {
                return ref.watch(daysOfReportsProvider(month: month));
              },
              onDateSelected: (date) {
                ref.read(selectedDateProvider.notifier).set(date);
                //_showReportStepper(context, ref);
              },
              onMonthChanged: (date) {
                ref.read(selectedDateProvider.notifier).clear();
                ref.read(selectedMonthProvider.notifier).set(date);
              },
            ),
          ),
        ),
        const ReportBottomSheet()
      ],
    );
  }
}
