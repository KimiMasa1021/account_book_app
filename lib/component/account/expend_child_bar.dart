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
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        InkWell(
          onTap: () => isShow.value = !isShow.value,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.grey,
                  blurRadius: 2,
                ),
              ],
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: colorType[index],
                  ),
                ),
                const SizedBox(width: 10),
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
                              priceList
                                  .reduce((value, element) => value + element),
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
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('dd').format(list![index]!.registeTime),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const Text(
                            "日",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: size.width / 2.1,
                            child: Text(
                              list![index]!.memo,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: size.width / 3.5,
                            child: Text(
                              iESwicherState
                                  ? NumberFormat("#,###")
                                      .format(list![index]!.price * -1)
                                  : NumberFormat("#,###")
                                      .format(list![index]!.price),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              ),
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

// 

