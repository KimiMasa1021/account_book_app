import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../component/account_add/input_date_field.dart';
import '../../../component/account_add/input_field.dart';
import '../../../constant/price_formatter.dart';

class SavingAdd extends HookConsumerWidget {
  const SavingAdd({super.key});
  static const String id = "saving_add";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow = useState(false);
    final date = DateFormat('yyyy/MM/dd').format(DateTime.now());
    final addPageController = ref.watch(usersControllerProvider.notifier);
    final dateController = useTextEditingController(text: date);
    final priceController = useTextEditingController(text: "");
    final memoController = useTextEditingController(text: "");
    final ValueNotifier<DateTime> outputDate = useState(DateTime.now());
    final savingController = ref.watch(savingControllerProvider.notifier);
    final usersState = ref.watch(usersControllerProvider);

    final id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              InputDateField(
                dateController: dateController,
                function: () async {
                  isShow.value = false;
                  dateController.text =
                      await addPageController.selectDate(context, outputDate);
                },
              ),
              InputField(
                title: "金額",
                type: TextInputType.number,
                function: () {
                  isShow.value = false;
                },
                controller: priceController,
                formatter: [
                  CustomTextInputFormatter(),
                ],
              ),
              InputField(
                title: "品目",
                type: TextInputType.text,
                function: () {
                  isShow.value = false;
                },
                controller: memoController,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  if (priceController.text == "" || memoController.text == "") {
                    savingController.showToast("金額と品目は必須項目です");
                  } else {
                    await savingController.addSaving(
                      outputDate.value,
                      priceController.text,
                      memoController.text,
                      id,
                      usersState!.name,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "保存する",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
