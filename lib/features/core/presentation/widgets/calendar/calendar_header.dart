
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key, required this.firstDayOfWeek});

  final int firstDayOfWeek;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final firstDateOfWeek = DateTime(
      date.year,
      date.month,
      date.day - (date.weekday - firstDayOfWeek) % 7,
    );
    final dateFormat = DateFormat('EEE');
    final days = [
      for (var i = 0; i < 7; i++)
        dateFormat
            .format(firstDateOfWeek.add(Duration(days: i)))
            .substring(0, 2),
    ];

    return Row(
      children: [
        for (final day in days)
          Expanded(
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.25,
                fontSize: 16,
                letterSpacing: 0.4,
                color: Colors.white,
                fontFamily: "Heebo",
                fontVariations: [
                  FontVariation("wght", 500),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
