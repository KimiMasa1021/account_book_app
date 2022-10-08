import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final stateBar = MediaQuery.of(context).padding.bottom +
        MediaQuery.of(context).padding.top;

    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      headerVisible: false,
      daysOfWeekHeight: 30,
      rowHeight: (size.height - stateBar - 100 - 72 - 30) / 7,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 0,
            ),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 129, 129, 129)!,
                width: 0.5,
              ),
            ),
            alignment: Alignment.topCenter,
            child: Text(
              day.day.toString(),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          );
        }),
        todayBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 0,
            ),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: const Color.fromARGB(255, 129, 129, 129)!,
                width: 0.5,
              ),
            ),
            alignment: Alignment.topCenter,
            child: Text(
              day.day.toString(),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          );
        }),
      ),
    );
  }
}
