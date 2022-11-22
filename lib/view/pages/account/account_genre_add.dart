import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/view/pages/account/account_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountGenreAdd extends HookConsumerWidget {
  const AccountGenreAdd({super.key});
  static const String id = "account_genre_add";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final genreController = ref.watch(authControllerProvider.notifier);

    final genreTextController = useTextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          iESwicherState ? "支出分類の追加" : "収入分類の追加",
          style: const TextStyle(
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: Center(
                  child: TextFormField(
                    controller: genreTextController,
                    autofocus: true,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: "新しい分類",
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (genreTextController.text == "") return;
                  genreController.addGenre(
                      genreTextController.text, iESwicherState);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AccountAdd.id, (route) => false);
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      "登録する",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
