import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/setting/setting_panel.dart';
import '../widgets/setting/user_data_panel.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserDataPanel(),
                SettingPanel(
                  text: 'フレンドの追加',
                  icon: Icons.person_add,
                  function: () {
                    // context.pushNamed(Routes.name().scanQr);
                  },
                ),
                SettingPanel(
                  text: 'フレンドの管理',
                  icon: Icons.group_outlined,
                  function: () {
                    // context.pushNamed(Routes.name().friendManagement);
                  },
                ),
                SettingPanel(
                  text: 'テーマの変更',
                  icon: Icons.format_paint_rounded,
                  function: () {
                    // context.pushNamed(Routes.name().designManagement);
                  },
                ),
                SettingPanel(
                  text: '使用上のヒント',
                  icon: Icons.tips_and_updates_outlined,
                  function: () async {
                    // if (!await launchUrl(
                    //   Uri.parse(WebViewType.appHint.url),
                    //   mode: LaunchMode.externalApplication,
                    // )) {
                    //   throw Exception('Could not launch');
                    // }
                  },
                ),
                SettingPanel(
                  text: 'ログアウト',
                  icon: Icons.logout_outlined,
                  function: () async {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => LottieDialog(
                    //     url: LottieUrl.logout.url,
                    //     title: 'ログアウト',
                    //     subTitle: '本当にログアウトしちゃうの?',
                    //     button1Title: 'ログアウト',
                    //     onTap1: () async {
                    //       await authCTL.signOut(() => {});
                    //     },
                    //     onTap2: () {
                    //       context.pop();
                    //     },
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
