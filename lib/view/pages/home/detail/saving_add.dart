import 'package:account_book_app/component/auth/normal_button.dart';
import 'package:account_book_app/component/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../constant/price_formatter.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

class SavingAdd extends HookConsumerWidget {
  const SavingAdd({
    super.key,
    required this.docId,
  });
  static String name = "saving_add";
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    final priceController = useTextEditingController(text: "");
    final memoController = useTextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text("追加"),
        titleTextStyle: theme.textTheme.fs19.copyWith(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            NormalTextField(
              topTitle: "金額",
              bottomTitle: "",
              hintText: "金額を入力してね",
              inputType: TextInputType.number,
              controller: priceController,
              formatter: [
                CustomTextInputFormatter(),
              ],
            ),
            NormalTextField(
              topTitle: "品目",
              bottomTitle: "",
              hintText: "品目を入力してね",
              inputType: TextInputType.text,
              controller: memoController,
            ),
            const Spacer(),
            NormalButton(
              text: "追加する！！",
              function: () async {
                await savingCTL.addSaving(
                  docId,
                  memoController.text,
                  priceController.text,
                  () {
                    context.pop();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
