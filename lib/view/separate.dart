import 'package:account_book_app/view/root_page.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/general_provider.dart';
import 'auth/auth.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});
  static const String id = "separate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    if (state == null) {
      return const Auth();
    } else {
      return RootPage();
    }
  }
}
