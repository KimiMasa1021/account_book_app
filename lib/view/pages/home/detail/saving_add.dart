import 'package:account_book_app/component/setting/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../constant/price_formatter.dart';
import '../../../theme/app_theme.dart';
import 'package:account_book_app/provider/general_provider.dart';

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
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final priceController = useTextEditingController(text: "");
    final ValueNotifier<int?> tagValue = useState(null);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      tags.length,
                      (index) => Tag(
                        tagValue: tagValue,
                        tag: tags[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 90,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: priceController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CustomTextInputFormatter(),
                      ],
                      style: theme.textTheme.fs27,
                      decoration: InputDecoration(
                        hintText: "金額を入力",
                        hintStyle: theme.textTheme.fs27,
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await savingCTL.addSaving(
                      docId,
                      tags.singleWhere((e) => e.id == tagValue.value).tag,
                      priceController.text,
                      () {
                        context.pop();
                      },
                    );
                  },
                  child: Container(
                    width: 90,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add!!",
                        style: theme.textTheme.fs16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
