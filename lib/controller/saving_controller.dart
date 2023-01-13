import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/repository/target_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/price_formatter.dart';

class SavingController extends StateNotifier<List<SavingState>> {
  final Ref ref;
  SavingController(this.ref) : super([]) {
    ref.read(targetRepositoryProvider).feachSaving().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }
  Future<void> addSaving(
    String productId,
    String memo,
    String price,
    Function() fucntion,
  ) async {
    final priceInt = int.parse(price.replaceAll(",", ""));
    final uid = ref.read(authControllerProvider)!.uid;
    final state = SavingState(
      createdAt: DateTime.now(),
      price: priceInt,
      productId: productId,
      userId: uid,
      memo: memo,
    );
    await ref.read(targetRepositoryProvider).addSaving(state);
    fucntion();
  }

  String formatYen(int targetPrice) {
    final numberFormat = NumberFormat(',###');
    return '${numberFormat.format(targetPrice)}円';
  }

  String formatDate(DateTime date) {
    final week = [
      "月",
      "火",
      "水",
      "木",
      "金",
      "土",
      "日",
    ];
    return "${DateFormat("MM月dd日(").format(date)}${week[date.weekday - 1]})";
  }

  Future<List<int>> culcWeeklyList(
    List<SavingState> savingList,
    ValueNotifier<DateTime> date,
  ) async {
    final additionalDay = date.value.subtract(const Duration(days: 6));
    return List.generate(7, (index) {
      final test = savingList
          .where(
            (e) =>
                DateTime(
                  e.createdAt.year,
                  e.createdAt.month,
                  e.createdAt.day,
                ) ==
                DateTime(
                  additionalDay.year,
                  additionalDay.month,
                  additionalDay.day + index,
                ),
          )
          .map((e) => e.price)
          .toList();
      if (test.isEmpty) return 0;

      return test.reduce((a, b) => a + b);
    });
  }

  bool checkSavingAdd(
    TextEditingController priceController,
    ValueNotifier<int?> tagValue,
  ) {
    if (priceController.text == "" && tagValue.value == null) {
      showToast("すべて入力してね");
      return false;
    }
    if (priceController.text == "") {
      showToast("金額を入力してね");
      return false;
    }
    if (tagValue.value == null) {
      showToast("タグを選択してね");
      return false;
    }
    return true;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }

  void calcButtonFunction(
    int index,
    TextEditingController priceController,
  ) {
    if (index != 3) {
      final preText = priceController.text;
      final tapedText = index >= 4 && index <= 9
          ? index.toString()
          : index == 10
              ? "0"
              : (index + 1).toString();
      final newText = preText + tapedText;

      priceController.value = CustomTextInputFormatter().formatEditUpdate(
        TextEditingValue(text: preText),
        TextEditingValue(text: newText),
      );
      return;
    } else if (index == 3 && priceController.text.isNotEmpty) {
      final preText = priceController.text;
      final newText = preText.substring(0, preText.length - 1);

      priceController.value = CustomTextInputFormatter().formatEditUpdate(
        TextEditingValue(text: preText),
        TextEditingValue(text: newText),
      );
      return;
    }
  }
}
