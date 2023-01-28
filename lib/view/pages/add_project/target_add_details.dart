import 'package:account_book_app/view/component/normal_text_field.dart';
import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../view_model/target_init_controller.dart';
import '../../component/large_text_field.dart';
import '../../../utility/price_formatter.dart';
import '../../../provider/route/routes.dart';

class TargetAddDetails extends HookConsumerWidget {
  const TargetAddDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetInit = ref.watch(targetInitControllerProvider(null));
    final targetInitCTL =
        ref.watch(targetInitControllerProvider(null).notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "詳細設定",
          // style: theme.textTheme.fs19,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (targetInitCTL.checkDetails()) {
                context.pushNamed(Routes.name().addProjectImage);
              }
            },
            padding: const EdgeInsets.only(right: 10),
            icon: const Text(
              "次へ",
              // style: theme.textTheme.fs16.copyWith(
              //   color: Colors.black,
              // ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              NormalTextField(
                topTitle: "目標",
                bottomTitle: "",
                hintText: "達成したい目標を入力してね",
                inputType: TextInputType.text,
                controller: targetInit.targetController!,
              ),
              NormalTextField(
                topTitle: "目標金額",
                bottomTitle: "",
                hintText: "目標金額",
                inputType: TextInputType.number,
                controller: targetInit.targetPriceController!,
                formatter: [
                  CustomTextInputFormatter(),
                ],
              ),
              LargeTextField(
                topTitle: "詳細",
                bottomTitle: "",
                hintText: "簡単な説明を入力してね",
                inputType: TextInputType.text,
                controller: targetInit.targetDescriptionController!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "達成予定年月日",
                    // style: theme.textTheme.fs16,
                  ),
                  InkWell(
                    onTap: () async {
                      primaryFocus?.unfocus();
                      await targetInitCTL.pickTargetDate(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            targetInit.targetDateController == null
                                ? "タップで選択"
                                : DateFormat('yyyy年MM月dd日')
                                    .format(targetInit.targetDateController!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
