import 'package:account_book_app/constant/color_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import '../../model/account_state.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

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
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);

    return Column(
      children: [
        InkWell(
          onTap: () => isShow.value = !isShow.value,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: colorType[index],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    list!.isNotEmpty
                        ? iESwicherState
                            ? NumberFormat("#,###").format(
                                priceList.reduce(
                                        (value, element) => value + element) *
                                    -1,
                              )
                            : NumberFormat("#,###").format(
                                priceList.reduce(
                                    (value, element) => value + element),
                              )
                        : "0",
                    style: TextStyle(
                      fontSize: 25,
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
          ),
        ),
        isShow.value
            ? SizedBox(
                height: list!.length * 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list![index]!.memo),
                              Text(DateFormat('yyyy/MM/dd')
                                  .format(list![index]!.registeTime)),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            iESwicherState
                                ? NumberFormat("#,###")
                                    .format(list![index]!.price * -1)
                                : NumberFormat("#,###")
                                    .format(list![index]!.price),
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
    );
  }
}
