import 'package:account_book_app/view/auth/sign_in.dart';
import 'package:account_book_app/view/auth/sign_up.dart';
import 'package:account_book_app/view/auth/top.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

enum Pages {
  top,
  signUp,
  signIn,
}

class Auth extends HookConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageControllerProvider);

    switch (pageState.page.toString()) {
      case "Pages.top":
        return const Top();
      case "Pages.SignUp":
        return const SignUp();
      case "Pages.SignIn":
        return const SignIn();
      default:
        return const SignIn();
    }
  }
}
