import 'package:account_book_app/constant/color_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import '../../model/account_state.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../provider/general_provider.dart';

class ExpendChildBar extends HookConsumerWidget {
  const ExpendChildBar({
    required this.title,
    super.key,
    required this.list,
    required this.color,
    required this.index,
  });
  final String title;
  final List<AccountState?>? list;
  final Color color;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> priceList = list!.map((e) => e!.price).toList();
    final isShow = useState(false);
    final size = MediaQuery.of(context).size;
    final accountProvider = ref.watch(accountControllerPrvider.notifier);
    final dateFormatForDayOfWeek = DateFormat.E('ja');
    return Container(
      width: double.infinity,
      height: isShow.value ? list!.length * 55 + 55 : 55,
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 55,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: colorType[index],
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => isShow.value = !isShow.value,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          list!.isNotEmpty
                              ? priceList[0] < 0
                                  ? accountProvider.pFormat(priceList.reduce(
                                          (value, element) => value + element) *
                                      -1)
                                  : accountProvider.pFormat(priceList.reduce(
                                      (value, element) => value + element))
                              : "0",
                          style: TextStyle(
                            fontSize: 28,
                            color: color,
                          ),
                        ),
                        !isShow.value
                            ? const Icon(
                                Icons.arrow_forward_ios_outlined,
                              )
                            : Transform.rotate(
                                angle: 90 * pi / 180,
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                              )
                      ],
                    ),
                  ),
                  isShow.value
                      ? SizedBox(
                          height: list!.length * 55,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final today = DateTime(
                                  list![index]!.registeTime.year,
                                  list![index]!.registeTime.month,
                                  list![index]!.registeTime.day);
                              final yesterday = index != 0
                                  ? DateTime(
                                      list![index - 1]!.registeTime.year,
                                      list![index - 1]!.registeTime.month,
                                      list![index - 1]!.registeTime.day)
                                  : null;
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: double.infinity,
                                height: 55,
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          DateFormat('dd').format(today),
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: yesterday == null
                                                ? Colors.black
                                                : yesterday == today
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '(${dateFormatForDayOfWeek.format(today)})',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: yesterday == null
                                                ? dateFormatForDayOfWeek
                                                            .format(today) ==
                                                        "土"
                                                    ? Colors.blue
                                                    : dateFormatForDayOfWeek
                                                                .format(
                                                                    today) ==
                                                            "日"
                                                        ? Colors.red
                                                        : Colors.black
                                                : yesterday == today
                                                    ? Colors.white
                                                    : dateFormatForDayOfWeek
                                                                .format(
                                                                    today) ==
                                                            "土"
                                                        ? Colors.blue
                                                        : dateFormatForDayOfWeek
                                                                    .format(
                                                                        today) ==
                                                                "日"
                                                            ? Colors.red
                                                            : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text(
                                        list![index]!.memo,
                                        style: const TextStyle(
                                          fontSize: 23,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      list![index]!.price < 0
                                          ? accountProvider
                                              .pFormat(list![index]!.price * -1)
                                          : accountProvider
                                              .pFormat(list![index]!.price),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: color,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
