import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/view/pages/home/target_add_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_theme.dart';

class TargetAddMember extends HookConsumerWidget {
  const TargetAddMember({super.key});
  static String name = "target_add_member";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("メンバーを選択", style: theme.textTheme.fs16),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        leading: InkWell(
          onTap: () {
            context.go("/");
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: HexColor("#FFF8DC"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(TargetAddDetails.name);
            },
            padding: const EdgeInsets.only(right: 10),
            icon: Text(
              "次へ",
              style: theme.textTheme.fs16.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#FFF8DC"),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(),
                            ),
                          ),
                          Text("あなた", style: theme.textTheme.fs16)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "君成田昌大君成田昌大君成田昌大君成田昌大君成田昌大",
                              style: theme.textTheme.fs16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Radio(
                            value: true,
                            onChanged: (val) {},
                            groupValue: "null",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "君成田昌大君成田昌大君成田昌大君成田昌大君成田昌大",
                              style: theme.textTheme.fs16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Radio(
                            value: true,
                            onChanged: (val) {},
                            groupValue: "null",
                          ),
                        ],
                      ),
                    ),
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
