import 'package:account_book_app/component/saving/member_list_tile.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../component/saving/add_member_argment.dart';
import '../../../component/saving/input_target_field.dart';
import '../../../constant/price_formatter.dart';
import 'saving_member_add.dart';

class SavingInit extends HookConsumerWidget {
  const SavingInit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingController = ref.watch(savingControllerProvider.notifier);

    final targetController = useTextEditingController(text: "");
    final targetPriceController = useTextEditingController(text: "");
    final userState = ref.watch(usersControllerProvider);
    final memberLists = ref.watch(memberListProvider);
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: const EdgeInsets.only(top: 13),
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
                    child: const Center(
                      child: Text(
                        "あなたに合った目標と目標金額\nを決めて節約をはじめよう!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  InputTargetField(
                    title: "目標",
                    hintText: '達成したい目標を入力してね',
                    inputType: TextInputType.name,
                    controller: targetController,
                    boxHeight: 80,
                    lineHeight: 2,
                  ),
                  InputTargetField(
                    title: "目標金額",
                    hintText: '目標金額を入力してね',
                    controller: targetPriceController,
                    inputType: TextInputType.number,
                    formatter: [CustomTextInputFormatter()],
                  ),
                  InputTargetField(
                    title: "グループ名",
                    hintText: '例：家族,カップル(短め推奨)',
                    controller: targetPriceController,
                    inputType: TextInputType.text,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "メンバー",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SavingMemberAdd.id);
                            },
                            child: Text(
                              "追加する",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MemberListTile(img: userState!.img, name: "あなた"),
                      Column(
                        children: List.generate(
                          memberLists.length,
                          (index) {
                            return MemberListTile(
                              img: memberLists[index].img,
                              name: memberLists[index].name,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await savingController.initTarget(
                            targetController.text,
                            int.parse(
                              targetPriceController.text.replaceAll(",", ""),
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: Colors.white,
                            border: Border.all(width: 3),
                          ),
                          child: const Center(
                            child: Text(
                              "目標設定完了",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}



                 // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const SizedBox(height: 13),
                  //     const Text(
                  //       "いつまでに達成したい？",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         fontSize: 26,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Container(
                  //       width: double.infinity,
                  //       height: 50,
                  //       padding: const EdgeInsets.symmetric(horizontal: 10),
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(20)),
                  //         color: Colors.white,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             offset: Offset(1, 1),
                  //             color: Colors.grey,
                  //             blurRadius: 3,
                  //           ),
                  //         ],
                  //       ),
                  //       child: DropdownButton(
                  //         hint: const Text("達成目安"),
                  //         isExpanded: true,
                  //         style: const TextStyle(
                  //             fontSize: 18, color: Colors.black),
                  //         underline: const SizedBox(),
                  //         items: [
                  //           const DropdownMenuItem(
                  //             value: "one_month",
                  //             child: Text("１か月後"),
                  //           ),
                  //           const DropdownMenuItem(
                  //             value: "tree_month",
                  //             child: Text("３か月後"),
                  //           ),
                  //           const DropdownMenuItem(
                  //             value: "six_month",
                  //             child: Text("半年後"),
                  //           ),
                  //           const DropdownMenuItem(
                  //             value: "year",
                  //             child: Text("１年後"),
                  //           ),
                  //           DropdownMenuItem(
                  //             value: "details",
                  //             child: Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.calendar_month_rounded,
                  //                   size: 25,
                  //                 ),
                  //                 SizedBox(width: 5),
                  //                 Text(
                  //                   "詳細な日程" + displayDate.value,
                  //                 ),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //         value: time.value,
                  //         onChanged: (String? value) async {
                  //           time.value = value;
                  //           if (targetPriceController.text == "") {
                  //             return;
                  //           }
                  //           final intPrice = double.parse(
                  //               targetPriceController.text.replaceAll(",", ""));
                  //           switch (value) {
                  //             case "one_month":
                  //               monthlySaving.value = intPrice;
                  //               weeklySaving.value = (intPrice / 4);
                  //               break;
                  //             case "tree_month":
                  //               monthlySaving.value = (intPrice / 3);
                  //               weeklySaving.value = (intPrice / 12);
                  //               break;
                  //             case "six_month":
                  //               monthlySaving.value = (intPrice / 6);
                  //               weeklySaving.value = (intPrice / 24);
                  //               break;
                  //             case "year":
                  //               monthlySaving.value = (intPrice / 12);
                  //               weeklySaving.value = (intPrice / 48);
                  //               break;
                  //             case "details":
                  //               final dateTime =
                  //                   await savingController.selectDate(context);
                  //               final day =
                  //                   dateTime.difference(DateTime.now()).inDays;
                  //               displayDate.value =
                  //                   DateFormat('(yyyy/MM/DD)').format(dateTime);
                  //               debugPrint(day.toString());
                  //               monthlySaving.value = (intPrice / (day / 30));
                  //               weeklySaving.value =
                  //                   (intPrice / ((day / 30) * 4));
                  //               break;
                  //           }
                  //         },
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // targetPriceController.text != "" && time.value != null
                  //     ? Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const SizedBox(height: 13),
                  //           const Text(
                  //             "節約の目安",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontSize: 26,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           RichText(
                  //             text: TextSpan(
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 20,
                  //               ),
                  //               children: [
                  //                 TextSpan(
                  //                   text: '１か月あたり ',
                  //                 ),
                  //                 TextSpan(
                  //                   text: NumberFormat("#,###")
                  //                       .format(monthlySaving.value),
                  //                   style: TextStyle(
                  //                     fontSize: 25,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 TextSpan(
                  //                   text: ' 円',
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           RichText(
                  //             text: TextSpan(
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 20,
                  //               ),
                  //               children: [
                  //                 TextSpan(
                  //                   text: '１週間当たり ',
                  //                 ),
                  //                 TextSpan(
                  //                   text: NumberFormat("#,###")
                  //                       .format(weeklySaving.value),
                  //                   style: TextStyle(
                  //                     fontSize: 25,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 TextSpan(
                  //                   text: ' 円',
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : SizedBox(),