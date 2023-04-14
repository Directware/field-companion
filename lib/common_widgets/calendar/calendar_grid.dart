import 'dart:developer';

import 'package:field_companion/common_widgets/calendar/calendar_cell.dart';
import 'package:flutter/material.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    super.key,
    required this.month,
    this.onDateSelected,
    this.selectedDate,
    required this.firstDayOfWeek,
    this.highlightedDates,
  });

  final DateTime month;
  final int firstDayOfWeek;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final List<DateTime>? highlightedDates;

  Widget _getCell(
    DateTime startDay,
    int week,
    int weekday,
    int daysBeforeMonth,
    int daysInGrid,
    int daysAfterMonth,
    int weeksInGrid,
    Function(DateTime) onTap,
  ) {
    final date = startDay.add(Duration(days: week * 7 + weekday));
    return CalendarCell(
      onTap: () => onTap(date),
      date: date,
      selected: date == selectedDate,
      highlight: highlightedDates?.contains(date) ?? false,
      disabled: week == 0 && weekday < daysBeforeMonth ||
          week == weeksInGrid - 1 && weekday >= daysInGrid - daysAfterMonth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstWeekdayOfMonth = month.weekday;
    final daysBeforeMonth = firstWeekdayOfMonth - firstDayOfWeek;
    final daysAfterMonth = 7 - firstDayOfWeek;
    final daysInGrid = daysInMonth + daysBeforeMonth + daysAfterMonth;
    final weeksInGrid = (daysInGrid / 7).ceil();
    final startDay = month.subtract(Duration(days: daysBeforeMonth));

    log("daysInMonth: $daysInMonth daysBeforeMonth: $daysBeforeMonth daysAfterMonth: $daysAfterMonth daysInGrid: $daysInGrid weeksInGrid: $weeksInGrid startDay: $startDay firstWeekdayOfMonth: $firstWeekdayOfMonth firstDayOfWeek: $firstDayOfWeek month: $month");

    return Column(
      children: [
        for (var week = 0; week < weeksInGrid; week++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: [
                for (var weekday = 0; weekday < 7; weekday++)
                  Expanded(
                    child: Center(
                      child: _getCell(
                        startDay,
                        week,
                        weekday,
                        daysBeforeMonth,
                        daysInGrid,
                        daysAfterMonth,
                        weeksInGrid,
                        (date) => onDateSelected?.call(date),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
