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
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.grey,
            blurRadius: 3,
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
