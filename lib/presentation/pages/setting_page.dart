import 'package:account_book_app/application/providers/setting_provider/provider/setting_provider.dart';
import 'package:account_book_app/presentation/widgets/setting/setting_panel.dart';
import 'package:account_book_app/presentation/widgets/setting/setting_panel_base.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/go_router_provider/routes/routes.dart';
import '../../application/providers/url_luncher_provider/notifier/url_luncher_notifier.dart';
import '../../application/providers/url_luncher_provider/provider/url_luncher_provider.dart';
import '../widgets/setting/user_data_panel.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlCTL = ref.watch(urlLuncherProvider.notifier);
    final settingCTL = ref.watch(settingProvider.notifier);

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
                      onTap: () {
                        context
                            .push("${Routes.setting}/${Routes.createFriend}");
                      },
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
                      onTap: () {
                        context.push("${Routes.setting}/${Routes.editTheme}");
                      },
                    ),
                    SettingPanel(
                      icon: Icons.language_outlined,
                      text: "言語の設定",
                      onTap: () async {},
                    ),
                    SettingPanel(
                      icon: Icons.description,
                      text: "このアプリについて",
                      onTap: () async {
                        await urlCTL.openUrl(WebViewType.aboutApp);
                      },
                    ),
                  ],
                ),
                SettingPanelBase(
                  widgetList: [
                    SettingPanel(
                      icon: Icons.manage_accounts_outlined,
                      text: "アカウント設定",
                      onTap: () async {},
                    ),
                    SettingPanel(
                      icon: Icons.logout_outlined,
                      text: "ログアウト",
                      onTap: () async => await settingCTL.showLogoutDialog(
                        context,
                        () {
                          context.pop();
                          context.go(Routes.signIn);
                        },
                      ),
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
