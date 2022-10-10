import 'package:flutter/material.dart';

import '../../model/account_state.dart';

class OneDayPanel extends StatelessWidget {
  const OneDayPanel({
    super.key,
    required this.day,
    required this.list,
  });

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
                .reduce((v, e) => v + e) *
            -1
        : 0;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$day日",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
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
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            sumIncome.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.greenAccent,
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
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                list[index].price >= 0
                                    ? list[index].price.toString()
                                    : (list[index].price * -1).toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
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
