import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' show NumberFormat;
import '../../../provider/general_provider.dart';

class DailyPage extends HookConsumerWidget {
  const DailyPage({required this.setDate, super.key});
  final ValueNotifier<DateTime> setDate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(processingPriceProvider(setDate.value)).when(
      data: (state) {
        return TableCalendar(
          locale: 'ja',
          shouldFillViewport: true,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: setDate.value,
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
          onDaySelected: (selectedDay, focusedDay) {
            setDate.value = selectedDay;
            DefaultTabController.of(context)?.animateTo(2);
          },
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
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(top: 4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }),
            markerBuilder: (context, day, events) {
              final list = state.allState
                  .where((val) =>
                      DateTime(val.registeTime.year, val.registeTime.month,
                          val.registeTime.day) ==
                      DateTime(day.year, day.month, day.day))
                  .toList();
              int sumExpend = list.where((e) => e.price < 0).isNotEmpty
                  ? list
                          .where((e) => e.price < 0)
                          .map((a) => a.price)
                          .toList()
                          .reduce((v, e) => v + e) *
                      -1
                  : 0;
              int sumIncome = list.where((e) => e.price > 0).isNotEmpty
                  ? list
                      .where((e) => e.price > 0)
                      .map((a) => a.price)
                      .toList()
                      .reduce((v, e) => v + e)
                  : 0;
              if (sumIncome == 0 && sumExpend == 0) {
                return const SizedBox();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat("#,###").format(sumIncome),
                      style: const TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      NumberFormat("#,###").format(sumExpend),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("えらーですねぇえ"),
        );
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}
