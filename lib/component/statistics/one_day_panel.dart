import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../model/account_state.dart';

class OneDayPanel extends StatelessWidget {
  OneDayPanel({
    super.key,
    required this.day,
    required this.list,
  }) {
    debugPrint("");
  }

  final String day;
  final List<AccountState> list;

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
            SizedBox(
              width: 55,
              child: Text(
                "$day日",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
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
                    SizedBox(
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
