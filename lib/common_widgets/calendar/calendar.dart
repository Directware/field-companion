import 'package:field_companion/common_widgets/calendar/calendar_page.dart';
import 'package:flutter/material.dart';

const _initialIndex = 9999999;

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    required this.initialMonth,
    this.onDateSelected,
    this.onMonthChanged,
    this.selectedDate,
    this.highlightedDates,
    this.firstDayOfWeek = 1,
  });

  final DateTime initialMonth;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final Function(DateTime)? onMonthChanged;
  final int firstDayOfWeek;
  final List<DateTime>? highlightedDates;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _pageController = PageController(initialPage: _initialIndex);
  DateTime _getMonth(int index) {
    return DateTime(
      widget.initialMonth.year,
      widget.initialMonth.month + index - _initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) => widget.onMonthChanged?.call(_getMonth(index)),
      itemBuilder: (context, index) {
        return CalendarPage(
          month: _getMonth(index),
          firstDayOfWeek: widget.firstDayOfWeek,
          selectedDate: widget.selectedDate,
          onDateSelected: widget.onDateSelected,
          highlightedDates: widget.highlightedDates,
        );
      },
    );
  }
}
