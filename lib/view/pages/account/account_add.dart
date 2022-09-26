import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../component/account/income_expend_swicher.dart';
import '../../../component/account_add/genre_panel.dart';
import '../../../component/account_add/input_date_field.dart';
import '../../../component/account_add/input_field.dart';
import '../../../constant/price_formatter.dart';

class AccountAdd extends HookConsumerWidget {
  const AccountAdd({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow = useState(false);
    final size = MediaQuery.of(context).size;
    final date = DateFormat('yyyy/MM/dd').format(DateTime.now());
    final addPageController = ref.watch(genreControllerProvider.notifier);
    final iESwicherState = ref.watch(incomeExpendSwicherProvider); //値の参照
    final dateController = useTextEditingController(text: date);
    final genreController = useTextEditingController(text: "");
    final priceController = useTextEditingController(text: "");
    final memoController = useTextEditingController(text: "");
    final ValueNotifier<DateTime> outputDate = useState(DateTime.now());
    final ValueNotifier<String> outputGenre = useState("");

    final accountController = ref.watch(accountControllerPrvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          iESwicherState ? "支出" : "収入",
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
      body: Stack(
        children: [
          Column(
            children: [
              const IncomeExpendSwicher(),
              InputDateField(
                dateController: dateController,
                function: () async {
                  isShow.value = false;
                  dateController.text =
                      await addPageController.selectDate(context, outputDate);
                },
              ),
              InputField(
                title: "分類",
                type: TextInputType.none,
                function: () {
                  isShow.value = true;
                },
                controller: genreController,
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
                title: "メモ",
                type: TextInputType.text,
                function: () {
                  isShow.value = false;
                },
                controller: memoController,
              ),
              genreController.text != "" && priceController.text != ""
                  ? InkWell(
                      onTap: () async {
                        final calculatedPrice = iESwicherState
                            ? int.parse(
                                    priceController.text.replaceAll(",", "")) *
                                -1
                            : int.parse(
                                priceController.text.replaceAll(",", ""));

                        final flg = await accountController.addAccount(
                          outputDate.value,
                          outputGenre.value,
                          calculatedPrice,
                          memoController.text,
                        );
                        if (flg == true) Navigator.pop(context);
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
                  : const SizedBox(),
            ],
          ),
          GenrePanel(
            genreController: genreController,
            isShow: isShow,
            outputGenre: outputGenre,
          )
        ],
      ),
    );
  }
}
