import 'package:field_companion/common_widgets/calendar/calendar_grid.dart';
import 'package:field_companion/common_widgets/calendar/calendar_header.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    super.key,
    required this.month,
    required this.firstDayOfWeek,
    this.onDateSelected,
    this.selectedDate,
    this.highlightedDates,
  });

  final DateTime month;
  final int firstDayOfWeek;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final List<DateTime>? highlightedDates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarHeader(firstDayOfWeek: firstDayOfWeek),
        const SizedBox(height: 7.0),
        CalendarGrid(
          month: month,
          firstDayOfWeek: firstDayOfWeek,
          selectedDate: selectedDate,
          onDateSelected: onDateSelected,
          highlightedDates: highlightedDates,
        )
      ],
    );
  }
}
