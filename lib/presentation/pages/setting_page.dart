import 'package:account_book_app/presentation/widgets/setting/setting_panel.dart';
import 'package:account_book_app/presentation/widgets/setting/setting_panel_base.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../view/theme/app_text_theme.dart';
import '../widgets/setting/user_data_panel.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                UserDataPanel(
                  onTap: () {},
                ),
                SettingPanelBase(
                  widgetList: [
                    SettingPanel(
                      icon: Icons.person_add,
                      text: "フレンドの追加",
                      onTap: () {},
                    ),
                    SettingPanel(
                      icon: Icons.group_outlined,
                      text: "フレンドの管理",
                      onTap: () {},
                    ),
                  ],
                ),
                SettingPanelBase(
                  widgetList: [
                    SettingPanel(
                      icon: Icons.format_paint_outlined,
                      text: "テーマの変更",
                      onTap: () {},
                    ),
                    SettingPanel(
                      icon: Icons.language_outlined,
                      text: "言語の設定",
                      onTap: () {},
                    ),
                    SettingPanel(
                      icon: Icons.description,
                      text: "このアプリについて",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
