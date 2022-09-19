import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/general_provider.dart';
import 'account/account.dart';
import 'auth/top.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    if (state == null) {
      return const Top();
    } else {
      return const AccountPage();
    }
  }
}
