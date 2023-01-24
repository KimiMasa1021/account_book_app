import 'package:account_book_app/model/enums.dart';
import 'package:account_book_app/provider/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/setting_palent_container.dart';
import 'widgets/setting_panel.dart';
import 'widgets/user_data_panel.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserDataPanel(),
              SettingParentContianer(
                children: [
                  SettingPanel(
                    text: 'アカウントの管理',
                    icon: Icons.manage_accounts_outlined,
                    function: () {
                      context.pushNamed(Routes.name().accountManagement);
                    },
                  ),
                  SettingPanel(
                    text: 'フレンドの管理',
                    icon: Icons.group_outlined,
                    function: () {
                      context.pushNamed(Routes.name().friendManagement);
                    },
                  ),
                  SettingPanel(
                    text: 'デザインの変更',
                    icon: Icons.format_paint_rounded,
                    function: () {
                      context.pushNamed(Routes.name().designManagement);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingParentContianer(
                children: [
                  SettingPanel(
                    text: 'ヒント',
                    icon: Icons.tips_and_updates_outlined,
                    function: () {
                      context.goNamed(
                        Routes.name().webView,
                        extra: WebViewType.appHint,
                      );
                    },
                  ),
                  SettingPanel(
                    text: 'このアプリについて',
                    icon: Icons.help_outline,
                    function: () {
                      context.goNamed(
                        Routes.name().webView,
                        extra: WebViewType.aboutApp,
                      );
                    },
                  ),
                  SettingPanel(
                    text: 'ログアウト',
                    icon: Icons.logout_outlined,
                    function: () {},
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
