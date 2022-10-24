import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../provider/general_provider.dart';

class OneDayAppBar extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final accountProvider = ref.watch(accountControllerPrvider.notifier);

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
                    fontWeight: FontWeight.bold,
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
                    Text(
                      accountProvider.pFormat(income),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("支出"),
                    Text(
                      accountProvider.pFormat(expend * -1),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("収支"),
                    Text(
                      accountProvider.pFormat(income + expend),
                      style: const TextStyle(fontSize: 20),
                    ),
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
