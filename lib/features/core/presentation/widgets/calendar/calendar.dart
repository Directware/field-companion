import 'package:field_companion/features/core/presentation/widgets/calendar/calendar_page.dart';
import 'package:flutter/material.dart';

const _initialIndex = 9999999;

class Calendar extends StatefulWidget {
  Calendar({
    super.key,
    required this.initialMonth,
    this.selectedMonth,
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
  final DateTime? selectedMonth;
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
  late final DateTime _initialMonth;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _initialMonth = widget.initialMonth;
    _currentMonth = widget.selectedMonth ?? _initialMonth;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Calendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedMonth != null && _currentMonth != widget.selectedMonth) {
      final yearDiff = _initialMonth.year - widget.selectedMonth!.year;
      final monthDiff = _initialMonth.month - widget.selectedMonth!.month;
      final diff = yearDiff * 12 + monthDiff;

      _currentMonth = widget.selectedMonth!;
      _pageController.jumpToPage(_initialIndex - diff);
    }
  }

  DateTime _getMonth(int index) {
    return DateTime(
      _initialMonth.year,
      _initialMonth.month + index - _initialIndex,
    );
  }

  void _onMonthChanged(int index) {
    _currentMonth = _getMonth(index);
    if (_currentMonth != widget.selectedMonth) {
      widget.onMonthChanged?.call(_currentMonth);
    }
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
          _pageController.animateToPage(
            index + pageOffset,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        widget.onDateSelected?.call(month);
      },
      highlightedDates: widget.highlightedBuilder(month),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onMonthChanged,
      itemBuilder: (context, index) {
        return _getCalendarPage(index);
      },
    );
  }
}
