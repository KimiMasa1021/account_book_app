import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key, required this.income, required this.expend});
  final int income;
  final int expend;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
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
            children: const [
              Icon(
                Icons.arrow_left,
                size: 50,
              ),
              Text(
                "2022年9月",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Icon(
                Icons.arrow_right,
                size: 50,
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
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("合計"),
                  Text(NumberFormat("#,###").format(income + expend)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
