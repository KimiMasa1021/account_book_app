import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/account_state.dart';
import '../../provider/general_provider.dart';

class OneDayPanel extends HookConsumerWidget {
  const OneDayPanel({
    super.key,
    required this.day,
    required this.list,
    required this.index,
    required this.setDate,
  });

  final String day;
  final List<AccountState> list;
  final int index;
  final ValueNotifier<DateTime> setDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            .reduce((v, e) => v + e)
        : 0;
    final accountProvider = ref.watch(accountControllerPrvider.notifier);
    final dateFormatForDayOfWeek = DateFormat.E('ja');
    final date = DateTime(setDate.value.year, setDate.value.month, index + 1);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 2),
            color: Colors.grey,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: list.isNotEmpty
                  ? const Border(
                      bottom: BorderSide(
                        width: 0.5,
                      ),
                    )
                  : null,
            ),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  width: 80,
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 40,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          color: DateTime.now().day == index + 1 &&
                                  DateTime.now().year == setDate.value.year &&
                                  DateTime.now().month == setDate.value.month
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: day,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '(${dateFormatForDayOfWeek.format(date)})',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: dateFormatForDayOfWeek
                                                .format(date) ==
                                            "土"
                                        ? Colors.blue
                                        : dateFormatForDayOfWeek.format(date) ==
                                                "日"
                                            ? Colors.red
                                            : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      accountProvider.pFormat(sumIncome),
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      accountProvider.pFormat(sumExpend),
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].memo,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            list[index].type,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      list[index].price >= 0
                          ? accountProvider.pFormat(list[index].price)
                          : accountProvider.pFormat(list[index].price * -1),
                      style: TextStyle(
                        fontSize: 22,
                        color:
                            list[index].price >= 0 ? Colors.green : Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 2),
//           width: 80,
//           child: Row(
//             children: [
//               Container(
//                 width: 8,
//                 height: 35,
//                 margin: const EdgeInsets.only(right: 3),
//                 decoration: BoxDecoration(
//                   color: DateTime.now().day == index + 1 &&
//                           DateTime.now().year == setDate.value.year &&
//                           DateTime.now().month == setDate.value.month
//                       ? Colors.blue
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     style: const TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: day,
//                         style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '(${dateFormatForDayOfWeek.format(date)})',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: dateFormatForDayOfWeek.format(date) == "土"
//                                 ? Colors.blue
//                                 : dateFormatForDayOfWeek.format(date) == "日"
//                                     ? Colors.red
//                                     : Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.only(left: 30, bottom: 10),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(2, 2),
//                 color: Color.fromARGB(255, 206, 206, 206),
//                 blurRadius: 2,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: list.isNotEmpty
//                       ? const Border(
//                           bottom: BorderSide(
//                             width: 0.5,
//                           ),
//                         )
//                       : null,
//                 ),
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       accountProvider.pFormat(sumIncome),
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.green,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Text(
//                       accountProvider.pFormat(sumExpend),
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: List.generate(
//                   list.length,
//                   (index) => Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     margin: const EdgeInsets.only(bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 list[index].memo,
//                                 style: const TextStyle(
//                                   fontSize: 25,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               Text(
//                                 list[index].type,
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           list[index].price >= 0
//                               ? accountProvider.pFormat(list[index].price)
//                               : accountProvider.pFormat(list[index].price * -1),
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: list[index].price >= 0
//                                 ? Colors.green
//                                 : Colors.red,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );