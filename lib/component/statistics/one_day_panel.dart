import 'package:flutter/material.dart';

import '../../model/account_state.dart';

class OneDayPanel extends StatelessWidget {
  const OneDayPanel({
    super.key,
    required this.day,
    required this.list,
    required this.index,
  });

  final String day;
  final List<AccountState> list;
  final int index;
  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: DateTime.now().day == index + 1
                  ? BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
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
                      const TextSpan(
                        text: '日',
                        style: TextStyle(fontSize: 15),
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
                        border: DateTime.now().day == index + 1
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
                            sumIncome.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            sumExpend.toString(),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].memo,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    list[index].type,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                list[index].price >= 0
                                    ? list[index].price.toString()
                                    : (list[index].price * -1).toString(),
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
