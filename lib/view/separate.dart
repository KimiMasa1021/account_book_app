import 'package:account_book_app/view/auth/top.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/general_provider.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});
  static const String id = "separate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final ttt = ref.watch(authControllerProvider.notifier);

    if (state == null) {
      return const Top();
    } else {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await ttt.signOut(() {});
            },
            child: const Text("ログアウト"),
          ),
        ),
      );
    }
  }
}
