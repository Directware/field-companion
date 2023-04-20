import 'package:field_companion/features/core/presentation/widgets/calendar/calendar_cell.dart';
import 'package:flutter/material.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    super.key,
    required this.month,
    required this.onDateSelected,
    required this.selectedDate,
    required this.firstDayOfWeek,
    required this.highlightedDates,
  });

  final DateTime month;
  final int firstDayOfWeek;
  final DateTime? selectedDate;
  final Function(DateTime, int) onDateSelected;
  final List<DateTime> highlightedDates;

  Widget _getCell(
    DateTime startDay,
    int week,
    int weekday,
    int daysBeforeMonth,
    int daysOfMonth,
    Function(DateTime, int) onTap,
  ) {
    final day = week * 7 + weekday;
    final date = startDay.add(Duration(days: day));

    final isPreviousMonth = day < daysBeforeMonth;
    final isNextMonth = day >= daysOfMonth + daysBeforeMonth;

    return CalendarCell(
      onTap: () => onTap(
        date,
        isPreviousMonth
            ? -1
            : isNextMonth
                ? 1
                : 0,
      ),
      date: date,
      selected: date == selectedDate,
      highlight: highlightedDates.contains(date),
      disabled: isPreviousMonth || isNextMonth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstWeekdayOfMonth = month.weekday;
    final daysBeforeMonth = firstWeekdayOfMonth - firstDayOfWeek;
    final weeksInGrid = ((daysInMonth + daysBeforeMonth) / 7).ceil();
    final startDay = month.subtract(Duration(days: daysBeforeMonth));

    return Column(
      children: [
        for (var week = 0; week < weeksInGrid; week++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
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
                        daysInMonth,
                        onDateSelected,
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
