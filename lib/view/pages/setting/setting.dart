import 'package:account_book_app/model/enums.dart';
import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utility/assets_url.dart';
import '../../component/lottie_dialog.dart';
import '../../theme/app_text_theme.dart';
import 'widgets/setting_panel.dart';
import 'widgets/user_data_panel.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final font = ref.watch(myTextTheme);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "設定",
                style: font.fs21,
              ),
              const UserDataPanel(),
              SettingPanel(
                text: 'フレンドの管理',
                icon: Icons.group_outlined,
                function: () {
                  context.pushNamed(Routes.name().friendManagement);
                },
              ),
              SettingPanel(
                text: 'テーマの変更',
                icon: Icons.format_paint_rounded,
                function: () {
                  context.pushNamed(Routes.name().designManagement);
                },
              ),
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
                function: () async {
                  showDialog(
                    context: context,
                    builder: (context) => LottieDialog(
                      url: LottieUrl.logout.url,
                      title: 'ログアウト',
                      subTitle: '本当にログアウトしちゃうの?',
                      button1Title: 'ログアウト',
                      onTap1: () async {
                        await authCTL.signOut(() => {});
                      },
                      onTap2: () {
                        context.pop();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
