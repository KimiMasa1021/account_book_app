import 'package:account_book_app/component/auth/normal_button.dart';
import 'package:account_book_app/constant/enums.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../component/auth/normal_text_field.dart';
import '../theme/app_theme.dart';

class SignUpMail extends HookConsumerWidget {
  const SignUpMail({
    super.key,
    required this.mailController,
  });
  final TextEditingController mailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final switcherCTL = ref.watch(authSwitcherPriovider.notifier);
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            switcherCTL.state = AuthPages.top;
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "メールアドレスを入力してください",
                style: theme.textTheme.fs21,
              ),
              NormalTextField(
                topTitle: 'メールアドレス',
                hintText: "メールアドレスを入力してください",
                bottomTitle: "",
                controller: mailController,
                inputType: TextInputType.emailAddress,
              ),
              NormalButton(
                text: "次へ",
                function: () {
                  switcherCTL.state = AuthPages.signUpPassword;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
