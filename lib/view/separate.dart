import 'package:account_book_app/view/auth/top.dart';
import 'package:account_book_app/view/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/general_provider.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});
  static const String id = "separate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final flg = useState(true);

    if (state != null && flg.value == true) {
      return const RootPage();
    } else {
      return Top(
        flg: flg,
      );
    }
  }
}
