import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/saving/input_target_field.dart';
import '../../../constant/price_formatter.dart';

class SavingInit extends HookConsumerWidget {
  const SavingInit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingController = ref.watch(savingControllerProvider.notifier);

    final targetController = useTextEditingController(text: "");
    final targetPriceController = useTextEditingController(text: "");

    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 15,
                  //         vertical: 4,
                  //       ),
                  //       margin: const EdgeInsets.only(right: 10),
                  //       decoration: const BoxDecoration(
                  //         color: Colors.grey,
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(50),
                  //         ),
                  //       ),
                  //       child: const Center(
                  //         child: Text(
                  //           "あなた",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const Icon(
                  //       Icons.group_add_outlined,
                  //       size: 30,
                  //     )
                  //   ],
                  // ),
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
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
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
                borderRadius: const BorderRadius.all(Radius.circular(100)),
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
        ),
      ],
    );
  }
}
