import 'package:account_book_app/component/setting/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_theme.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "設定",
                  style: theme.textTheme.fs27,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("君成田昌大"),
                        Text("k.massan46@gmail.com"),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SettingTile(
                  leftIcon: Icons.person,
                  leftTitle: "アカウント設定",
                  leftFunction: () {},
                  rightIcon: Icons.groups,
                  rightTitle: "フレンド管理",
                  rightFunction: () {},
                ),
                SettingTile(
                  leftIcon: Icons.help,
                  leftTitle: "使用上のヒント",
                  leftFunction: () {},
                  rightIcon: Icons.palette,
                  rightTitle: "テーマの変更",
                  rightFunction: () {},
                ),
                SettingTile(
                  leftIcon: Icons.logout,
                  leftTitle: "ログアウト",
                  leftFunction: () {},
                  rightIcon: Icons.lightbulb_sharp,
                  rightTitle: "○○について",
                  rightFunction: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
