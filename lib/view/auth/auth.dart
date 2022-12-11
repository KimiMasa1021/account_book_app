import 'package:account_book_app/constant/enums.dart';
import 'package:account_book_app/view/auth/sign_in.dart';
import 'package:account_book_app/view/auth/sign_up.dart';
import 'package:account_book_app/view/auth/top.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class Auth extends HookConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switcherState = ref.watch(authSwitcherPriovider);

    if (switcherState == Pages.top) {
      return const Top();
    } else if (switcherState == Pages.signIn) {
      return const Top();
    } else if (switcherState == Pages.signUp) {
      return const Top();
    } else {
      return const Top();
    }
  }
}
