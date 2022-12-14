import 'package:account_book_app/constant/enums.dart';
import 'package:account_book_app/view/auth/sign_up_mail.dart';
import 'package:account_book_app/view/auth/sign_up_pass.dart';
import 'package:account_book_app/view/auth/top.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class Auth extends HookConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcherState = ref.watch(authSwitcherPriovider);
    final mailController = TextEditingController(text: "");
    final passController = TextEditingController(text: "");
    final nameController = TextEditingController(text: "");

    switch (switcherState) {
      case AuthPages.top:
        return const Top();
      case AuthPages.signUpEmail:
        return SignUpMail(
          mailController: mailController,
        );
      case AuthPages.signUpPassword:
        return SignUpPassword(
          nameController: nameController,
          passController: passController,
        );
      default:
        return const Top();
    }
  }
}
