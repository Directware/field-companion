import 'package:flutter/material.dart';

class CustomTableCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomTableCalendar({required this.onDateSelected});

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          _buildTableCalendar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                _selectedDate =
                    _selectedDate.subtract(const Duration(days: 30));
              });
            },
          ),
          Text(
            "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.add(const Duration(days: 30));
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    final List<TableRow> tableRows = [];
    final List<DateTime> daysInMonth = _getDaysInMonth(_selectedDate);

    // Add the days of the week as the first row
    tableRows.add(
      TableRow(
        children: List.generate(
          7,
          (index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.center,
            child: Text(
              _getDayName(index + 1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

    // Add the dates of the month in a table format
    for (int i = 0; i < daysInMonth.length; i += 7) {
      final List<Widget> rowChildren = [];

      for (int j = i; j < i + 7 && j < daysInMonth.length; j++) {
        rowChildren.add(
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = daysInMonth[j];
                });
                widget.onDateSelected(_selectedDate);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  //color: _isSelectedDate(daysInMonth[j])
                  //  ? Colors.blue.withOpacity(0.3)
                  //: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  daysInMonth[j].day.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    //color: _isSelectedDate(daysInMonth[j])
                    //    ? Colors.blue
                    //    : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      tableRows.add(
        TableRow(
          children: rowChildren,
        ),
      );
    }

    return Table(
      border: TableBorder.symmetric(
        inside: const BorderSide(color: Colors.grey),
      ),
      children: tableRows,
    );
  }

  //List<DateTime> _getDaysInMonth(DateTime selectedDate) {}

  List<DateTime> _getDaysInMonth(DateTime month) {
    final List<DateTime> days = [];

    // Get the first day of the month
    final DateTime firstDayOfMonth = DateTime(month.year, month.month);

    // Calculate the number of days in the month
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    // Calculate the number of days to display from the previous month
    final daysFromPrevMonth = firstDayOfMonth.weekday - 1;

    // Get the last day of the previous month
    final lastDayOfPrevMonth = DateTime(month.year, month.month, 0);

    // Add the days from the previous month to the list
    for (int i = daysFromPrevMonth; i > 0; i--) {
      days.add(
        DateTime(
          lastDayOfPrevMonth.year,
          lastDayOfPrevMonth.month,
          lastDayOfPrevMonth.day - i + 1,
        ),
      );
    }

    // Add the days from the current month to the list
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(month.year, month.month, i));
    }

    // Add the days from the next month to the list
    final daysFromNextMonth = 42 - days.length;
    final firstDayOfNextMonth = DateTime(
      month.year,
      month.month + 1,
    );
    for (int i = 1; i <= daysFromNextMonth; i++) {
      days.add(
        DateTime(firstDayOfNextMonth.year, firstDayOfNextMonth.month, i),
      );
    }

    return days;
  }

  String _getDayName(int i) {
    switch (i) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  _isSelectedDate(DateTime daysInMonth) {
    return _selectedDate.year == daysInMonth.year &&
        _selectedDate.month == daysInMonth.month &&
        _selectedDate.day == daysInMonth.day;
  }
}
