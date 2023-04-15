import 'package:field_companion/common_widgets/calendar/calendar_page.dart';
import 'package:flutter/material.dart';

const _initialIndex = 9999999;

class Calendar extends StatefulWidget {
  Calendar({
    super.key,
    required this.initialMonth,
    this.onDateSelected,
    this.onMonthChanged,
    this.selectedDate,
    this.firstDayOfWeek = 1,
    List<DateTime>? highlightedDates,
    List<DateTime> Function(DateTime month)? highlightedBuilder,
  }) {
    this.highlightedBuilder =
        highlightedBuilder ?? (month) => highlightedDates ?? [];
  }

  final DateTime initialMonth;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final Function(DateTime)? onMonthChanged;
  final int firstDayOfWeek;
  late final List<DateTime> Function(DateTime month) highlightedBuilder;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _pageController = PageController(initialPage: _initialIndex);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DateTime _getMonth(int index) {
    return DateTime(
      widget.initialMonth.year,
      widget.initialMonth.month + index - _initialIndex,
    );
  }

  Widget _getCalendarPage(int index) {
    final month = _getMonth(index);
    return CalendarPage(
      month: month,
      firstDayOfWeek: widget.firstDayOfWeek,
      selectedDate: widget.selectedDate,
      onDateSelected: (month, pageOffset) {
        final updatePageOffset = pageOffset != 0;
        if (updatePageOffset) {
          _pageController
              .animateToPage(
                index + pageOffset,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              )
              .then((value) => widget.onDateSelected?.call(month));
        } else {
          widget.onDateSelected?.call(month);
        }
      },
      highlightedDates: widget.highlightedBuilder(month),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) => widget.onMonthChanged?.call(_getMonth(index)),
      itemBuilder: (context, index) {
        return _getCalendarPage(index);
      },
    );
  }
}
