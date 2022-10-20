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

    return InkWell(
      onTap: () => isShow.value = !isShow.value,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Container(
              width: 10,
              height: double.infinity,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: colorType[index],
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Expanded(
              child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
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
                              : accountProvider.pFormat(priceList
                                  .reduce((value, element) => value + element))
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
            ),
          ],
        ),
      ),
    );
  }
}

        // isShow.value
        //     ? SizedBox(
        //         height: list!.length * 55,
        //         child: ListView.builder(
        //           physics: const NeverScrollableScrollPhysics(),
        //           itemCount: list!.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return Container(
        //               padding: const EdgeInsets.all(5),
        //               width: double.infinity,
        //               height: 55,
        //               decoration: const BoxDecoration(
        //                 color: Colors.white,
        //                 border: Border.symmetric(
        //                   vertical: BorderSide(
        //                     color: Colors.black12,
        //                   ),
        //                 ),
        //               ),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Text(
        //                         DateFormat('dd')
        //                             .format(list![index]!.registeTime),
        //                         style: const TextStyle(
        //                           fontSize: 25,
        //                         ),
        //                       ),
        //                       const Text(
        //                         "日",
        //                         style: TextStyle(
        //                           fontSize: 20,
        //                         ),
        //                       ),
        //                       const SizedBox(width: 10),
        //                     ],
        //                   ),
        //                   Expanded(
        //                     child: Text(
        //                       list![index]!.memo,
        //                       style: const TextStyle(
        //                         fontSize: 18,
        //                       ),
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ),
        //                   Text(
        //                     list![index]!.price < 0
        //                         ? accountProvider
        //                             .pFormat(list![index]!.price * -1)
        //                         : accountProvider.pFormat(list![index]!.price),
        //                     textAlign: TextAlign.end,
        //                     style: TextStyle(
        //                       fontSize: 20,
        //                       color: color,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //       )
        //     : const SizedBox(),

