import 'package:account_book_app/component/normal_text_field.dart';
import 'package:account_book_app/constant/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../component/large_text_field.dart';
import '../../../../constant/price_formatter.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

class TargetAddDetails extends HookConsumerWidget {
  const TargetAddDetails({super.key});
  static String name = "target_add_details";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final size = MediaQuery.of(context).size;

    final targetInit = ref.watch(targetInitControllerProvider);
    final targetInitCTL = ref.watch(targetInitControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("詳細設定", style: theme.textTheme.fs16),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: HexColor("#FFF8DC"),
        actions: [
          IconButton(
            onPressed: () async {
              await targetInitCTL.createNewTarget(() => context.go("/"));
            },
            padding: const EdgeInsets.only(right: 10),
            icon: Text(
              "作成",
              style: theme.textTheme.fs16.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor("#FFF8DC"),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 60),
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
                            Text("達成予定年月日", style: theme.textTheme.fs16),
                            InkWell(
                              onTap: () async {
                                primaryFocus?.unfocus();
                                await targetInitCTL.pickTargetDate(context);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      targetInit.targetDateController == null
                                          ? "タップで選択"
                                          : DateFormat('yyyy年MM月dd日').format(
                                              targetInit.targetDateController!),
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
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: size.width / 2 - 60,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: targetInit.file != null
                          ? DecorationImage(
                              image: FileImage(targetInit.file!),
                              fit: BoxFit.fill,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 6,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: GestureDetector(
                    onTap: () async {
                      await targetInitCTL.getImage(ImageSource.camera);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
