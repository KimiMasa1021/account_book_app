import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ja',
      shouldFillViewport: true,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      daysOfWeekHeight: 40,
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      headerStyle: const HeaderStyle(
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leftChevronIcon: Icon(Icons.arrow_back_ios_new),
        rightChevronIcon: Icon(Icons.arrow_forward_ios),
      ),
      onHeaderTapped: (dateTIme) {
        debugPrint(dateTIme.toString());
      },
      daysOfWeekStyle: const DaysOfWeekStyle(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 192, 215, 255),
        ),
        weekdayStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        weekendStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        outsideBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
            ),
            alignment: Alignment.topCenter,
          );
        }),
        defaultBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                day.day.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
        todayBuilder: ((context, day, focusedDay) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
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
