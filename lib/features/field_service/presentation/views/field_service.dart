import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/presentation/widgets/calendar/calendar.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/days_of_reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/goals/goal_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/field_service_menu_button.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/report_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/stats_header.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/studies_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldService extends ConsumerWidget {
  const FieldService({super.key});

  void _onMenuItemTap(BuildContext context, String key) {
    switch (key) {
      case 'service.chooseMonth':
        break;
      case 'service.inputStudies':
        _showStudiesBottomSheet(context);
        break;
      case 'service.durationGoals':
        _showGoalBottomSheet(context);
        break;
      case 'service.sendReport':
        break;
    }
  }

  void _showGoalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => const GoalBottomSheet(),
    );
  }

  void _showStudiesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => const StudiesBottomSheet(),
    );
  }

  void _showMonthPickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => const GoalBottomSheet(),
    );
  }

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
          onTap: () => _showMonthPickerBottomSheet(context),
          title: month,
          trailing: FieldServiceMenuButton(
            items: const [
              'service.chooseMonth',
              'service.inputStudies',
              'service.durationGoals',
              'service.sendReport'
            ],
            onMenuItemTap: (key) => _onMenuItemTap(context, key),
          ),
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
              },
              onMonthChanged: (date) {
                if (date.year != selectedDate?.year ||
                    date.month != selectedDate?.month) {
                  ref.read(selectedDateProvider.notifier).clear();
                }
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
