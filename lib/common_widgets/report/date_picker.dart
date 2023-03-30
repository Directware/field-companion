import 'package:field_companion/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime selectedDate = DateTime.now();

  // testing data
  final Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Event 1'],
    DateTime.now().add(const Duration(days: 1)): ['Event 2'],
    DateTime.now().subtract(const Duration(days: 3)): ['Event 3'],
    DateTime.now().subtract(const Duration(days: 10)): ['Event 3'],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            firstDay: DateTime(DateTime.now().year, DateTime.now().month - 1),
            lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
            currentDay: selectedDate,
            // no idea why you need currenDay and focusedDay
            focusedDay: selectedDate,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedDate = selectedDay;
              });
            },
            availableGestures: AvailableGestures.none,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
                fontWeight: FontWeight.bold,
              ),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: const TextStyle(color: ColorPalette.grey2),
              weekendTextStyle: const TextStyle(color: ColorPalette.grey2),
              todayTextStyle: const TextStyle(color: ColorPalette.green),
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                color: ColorPalette.greenOpacity20,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              markersMaxCount: 1,
              markerSize: 35,
              markersAutoAligned: false,
              markersAlignment: Alignment.topCenter,
              // TODO: fix the position of the markers, they work on the iPhone 14 pro max, but not on the iPhone 14
              markersOffset: const PositionedOffset(
                top: 0,
                start: 13,
                bottom: 0,
                end: 0,
              ),
              markerDecoration: BoxDecoration(
                color: ColorPalette.greenOpacity20,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (day) {
              List<DateTime> events = [];

              _events.forEach((key, value) {
                if (key.year == day.year &&
                    key.month == day.month &&
                    key.day == day.day) {
                  events.add(key);
                }
              });

              return events;
            },
          ),
        ],
      ),
    );
  }
}
