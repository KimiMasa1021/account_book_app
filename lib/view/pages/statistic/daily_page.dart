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
      locale: 'ja',
      shouldFillViewport: true,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      headerVisible: false,
      daysOfWeekHeight: 40,
      calendarBuilders: CalendarBuilders(
        outsideBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
                right: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                day.day.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }),
        defaultBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
                right: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                day.day.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          );
        }),
        todayBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Text(
                  day.day.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
