import 'package:account_book_app/component/auth/normal_button.dart';
import 'package:account_book_app/constant/enums.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../component/auth/normal_text_field.dart';
import '../theme/app_theme.dart';

class SignUpPassword extends HookConsumerWidget {
  const SignUpPassword({
    super.key,
    required this.nameController,
    required this.passController,
  });
  final TextEditingController nameController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcherCTL = ref.watch(authSwitcherPriovider.notifier);
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            switcherCTL.state = AuthPages.signUpEmail;
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
                "登録",
                style: theme.textTheme.fs21,
              ),
              NormalTextField(
                topTitle: "ユーザー名",
                hintText: "ニックネームを入力してください",
                bottomTitle: "",
                controller: nameController,
                inputType: TextInputType.name,
              ),
              NormalTextField(
                topTitle: "パスワード",
                hintText: "パスワードを入力してください",
                bottomTitle: "6~20文字としてください",
                controller: passController,
                inputType: TextInputType.visiblePassword,
              ),
              NormalButton(
                text: "次へ",
                function: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
