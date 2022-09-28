import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
    required this.income,
    required this.expend,
    required this.setDate,
  });
  final int income;
  final int expend;
  final ValueNotifier<DateTime> setDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setDate.value =
                      DateTime(setDate.value.year, setDate.value.month - 1);
                },
                child: const Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
              ),
              Text(
                DateFormat('yyyy年MM月').format(setDate.value),
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  setDate.value =
                      DateTime(setDate.value.year, setDate.value.month + 1);
                },
                child: const Icon(
                  Icons.arrow_right,
                  size: 50,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text("収入"),
                  Text(
                    NumberFormat("#,###").format(income),
                    style: const TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("支出"),
                  Text(
                    NumberFormat("#,###").format(expend * -1),
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("合計"),
                  Text(
                    NumberFormat("#,###").format(income + expend),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
