import 'package:account_book_app/component/auth/shadow_button.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/view/auth/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_theme.dart';

class Top extends HookConsumerWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final authCTL = ref.watch(authControllerProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/736x/63/cd/98/63cd989ececcace76faa147586f2fa47--nice.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "仮の名前",
                    style: theme.textTheme.fs33.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "仮の簡単な説明仮の\n仮の簡単な説明仮の仮の",
                    style: theme.textTheme.fs21,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  ShadowButton(
                    text: "Googleでサインアップ",
                    function: () async {
                      await authCTL.signInWithGoogle();
                    },
                  ),
                  const SizedBox(height: 20),
                  ShadowButton(
                    text: "Appleでサインアップ",
                    function: () {},
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(PrivacyPolicyPage.name);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("利用規約"),
                        Text(" | "),
                        Text("プライバシーポリシー"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
