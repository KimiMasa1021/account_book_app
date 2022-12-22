import 'package:account_book_app/component/setting/setting_tile.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_management.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final userState = ref.watch(usersControllerProvider);

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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(userState!.img),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0),
                            blurRadius: 6,
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userState.name),
                        Text(userState.email),
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
                  rightFunction: () {
                    context.pushNamed(FriendsManagement.name);
                  },
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
