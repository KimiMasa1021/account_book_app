import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../component/auth/normal_button.dart';
import '../../constant/enums.dart';
import '../../provider/general_provider.dart';
import '../theme/app_theme.dart';

class Top extends HookConsumerWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcherCTL = ref.watch(authSwitcherPriovider.notifier);
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "○○○○",
                  style: theme.textTheme.fs33
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                NormalButton(
                  text: "新規登録",
                  function: () {
                    switcherCTL.state = AuthPages.signUpEmail;
                  },
                ),
                NormalButton(
                  text: "ログイン",
                  function: () {
                    switcherCTL.state = AuthPages.signIn;
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
