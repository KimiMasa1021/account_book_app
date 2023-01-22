import 'package:account_book_app/provider/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view_model/users_controller.dart';
import '../../component/panel/setting_panel.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: double.infinity,
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.3),
              //         offset: const Offset(0, 0),
              //         blurRadius: 6,
              //       )
              //     ],
              //   ),
              //   child: Center(
              //     child: Text(
              //       "プレミアム機能紹介",
              //       // style: theme.textTheme.fs27,
              //     ),
              //   ),
              // ),
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
                      image: userState!.img != ""
                          ? DecorationImage(
                              image: NetworkImage(
                                userState.img,
                              ),
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
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
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SettingPanel(
                      text: 'ヒント',
                      icon: Icons.tips_and_updates_outlined,
                      function: () {},
                    ),
                    SettingPanel(
                      text: 'このアプリについて',
                      icon: Icons.help_outline,
                      function: () {},
                    ),
                    SettingPanel(
                      text: 'ログアウト',
                      icon: Icons.logout_outlined,
                      function: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
