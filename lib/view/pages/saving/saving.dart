import 'package:account_book_app/view/pages/saving/saving_data.dart';
import 'package:account_book_app/view/pages/saving/saving_init.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/general_provider.dart';

class Saving extends HookConsumerWidget {
  const Saving({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);

    if (usersState!.target != "") {
      debugPrint(usersState.target);
      return const SavingData();
    } else {
      return const SavingInit();
    }
  }
}
