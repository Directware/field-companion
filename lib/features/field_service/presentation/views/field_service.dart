import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/presentation/widgets/calendar/calendar.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/days_of_reports_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_date_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/reports/selected_month_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/tips/current_tip_provider.dart';
import 'package:field_companion/features/field_service/presentation/widgets/goals/goal_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/field_service_menu_button.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/month_picker_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/report/report_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/stats_header.dart';
import 'package:field_companion/features/field_service/presentation/widgets/stats/studies_bottom_sheet.dart';
import 'package:field_companion/features/field_service/presentation/widgets/tips/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldService extends ConsumerWidget {
  const FieldService({super.key});

  void _onMenuItemTap(BuildContext context, WidgetRef ref, String key) {
    switch (key) {
      case 'service.chooseMonth':
        _showMonthPickerBottomSheet(context, ref);
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

  void _showMonthPickerBottomSheet(BuildContext context, WidgetRef ref) {
    ref.read(selectedDateProvider.notifier).clear();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => const MonthPickerBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final initialMonth = ref.read(selectedMonthProvider);
    final month = DateFormat('MMMM y').format(selectedMonth);
    final tip = ref.watch(currentTipProvider);

    return Column(
      children: [
        TitleBar(
          onTap: () => _showMonthPickerBottomSheet(context, ref),
          title: month,
          trailing: FieldServiceMenuButton(
            items: const [
              'service.chooseMonth',
              'service.inputStudies',
              'service.durationGoals',
              'service.sendReport'
            ],
            onMenuItemTap: (key) => _onMenuItemTap(context, ref, key),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StatsHeader(),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 320,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Calendar(
              initialMonth: initialMonth,
              selectedMonth: selectedMonth,
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
        Expanded(child: Container()),
        if (tip != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Tip(
              text: tip,
              onTap: () => ref.read(currentTipProvider.notifier).acknowledge(),
            ),
          ),
        const ReportBottomSheet()
      ],
    );
  }
}
