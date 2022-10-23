import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/account_state.dart';
import '../../provider/general_provider.dart';

class OneDayPanel extends HookConsumerWidget {
  const OneDayPanel({
    super.key,
    required this.day,
    required this.list,
    required this.index,
    required this.setDate,
  });

  final String day;
  final List<AccountState> list;
  final int index;
  final ValueNotifier<DateTime> setDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final accountProvider = ref.watch(accountControllerPrvider.notifier);
    final dateFormatForDayOfWeek = DateFormat.E('ja');
    final date = DateTime(setDate.value.year, setDate.value.month, index + 1);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // decoration: DateTime.now().day == index + 1 &&
              //         DateTime.now().year == setDate.value.year &&
              //         DateTime.now().month == setDate.value.month
              //     ? BoxDecoration(
              //         color: Colors.blueAccent.withOpacity(0.4),
              //         borderRadius: BorderRadius.circular(10),
              //       )
              //     : null,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              width: 60,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: day,
                        style: const TextStyle(fontSize: 25),
                      ),
                      TextSpan(
                        text: '(${dateFormatForDayOfWeek.format(date)})',
                        style: TextStyle(
                            fontSize: 15,
                            color: dateFormatForDayOfWeek.format(date) == "土"
                                ? Colors.blue
                                : dateFormatForDayOfWeek.format(date) == "日"
                                    ? Colors.red
                                    : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      color: Color.fromARGB(255, 206, 206, 206),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: list.isNotEmpty
                            ? const Border(
                                bottom: BorderSide(
                                  width: 0.5,
                                ),
                              )
                            : null,
                      ),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            accountProvider.pFormat(sumIncome),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            accountProvider.pFormat(sumExpend),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(
                        list.length,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index].memo,
                                      style: const TextStyle(
                                        fontSize: 25,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      list[index].type,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                list[index].price >= 0
                                    ? accountProvider.pFormat(list[index].price)
                                    : accountProvider
                                        .pFormat(list[index].price * -1),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: list[index].price >= 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
