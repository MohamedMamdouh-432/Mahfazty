import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpenseDatePicker extends StatelessWidget {
  const ExpenseDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TableCalendar(
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.now(),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.week,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onCalendarCreated: (controller) {},
        onDaySelected: (selectedDay, focusedDay) {},
      ),
    );
  }
}
