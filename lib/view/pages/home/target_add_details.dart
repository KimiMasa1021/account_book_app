import 'package:account_book_app/component/auth/normal_text_field.dart';
import 'package:account_book_app/constant/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_theme.dart';

class TargetAddDetails extends HookConsumerWidget {
  const TargetAddDetails({super.key});
  static String name = "target_add_details";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final size = MediaQuery.of(context).size;
    final testController = TextEditingController(text: "");

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
            onPressed: () {},
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
                          controller: testController,
                        ),
                        NormalTextField(
                          topTitle: "目標金額",
                          bottomTitle: "",
                          hintText: "タップで選択",
                          inputType: TextInputType.text,
                          controller: testController,
                        ),
                        NormalTextField(
                          topTitle: "達成予定年月日",
                          bottomTitle: "",
                          hintText: "タップで選択",
                          inputType: TextInputType.text,
                          controller: testController,
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
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("画像編集");
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
