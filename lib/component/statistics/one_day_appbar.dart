import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OneDayAppBar extends StatelessWidget {
  const OneDayAppBar({
    super.key,
    required this.setDate,
    required this.expend,
    required this.income,
  });
  final ValueNotifier<DateTime> setDate;
  final int expend;
  final int income;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.grey,
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("収入"),
                    Text(income.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Text("支出"),
                    Text((expend * -1).toString()),
                  ],
                ),
                Column(
                  children: [
                    const Text("収支"),
                    Text((income + expend).toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
