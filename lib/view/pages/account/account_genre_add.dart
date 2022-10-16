import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/account/income_expend_swicher.dart';

class AccountGenreAdd extends HookConsumerWidget {
  const AccountGenreAdd({super.key});
  static const String id = "account_genre_add";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final usersState = ref.watch(usersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          iESwicherState ? "支出分類の追加" : "収入分類の追加",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [TextField()],
          ),
        ),
      ),
    );
  }
}
