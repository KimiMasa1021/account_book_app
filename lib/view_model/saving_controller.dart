import 'package:account_book_app/repository/target_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/saving/saving_state.dart';
import '../utility/price_formatter.dart';
import 'auth_controller.dart';

final savingControllerProvider =
    StateNotifierProvider<SavingController, List<SavingState>>(
        (ref) => SavingController(ref));

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
    //週初め？？
    final startWeekDate =
        date.value.subtract(Duration(days: date.value.weekday - 1));

    //週末
    final endWeekDate = date.value.add(Duration(days: 7 - date.value.weekday));

    final weekSavingList = savingList.where(
      (e) =>
          e.createdAt.isBefore(endWeekDate) &&
          e.createdAt.isAfter(startWeekDate),
    );

    return List.generate(7, (index) {
      final weeklySaving = weekSavingList
          .where((e) => e.createdAt.weekday == index + 1)
          .map((e) => e.price);
      if (weeklySaving.isEmpty) {
        return 0;
      }
      return weeklySaving.reduce((v, e) => v + e);
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
    if (index != 3 && index != 4) {
      final preText = priceController.text;
      final tapedText = index >= 0 && index <= 2
          ? (index + 1).toString()
          : index >= 5 && index <= 10
              ? (index - 1).toString()
              : index == 11
                  ? 0.toString()
                  : "0";
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
    } else if (index == 4) {
      return;
    }
  }

  String formatWeek(int weekIndex) {
    final week = [
      "月",
      "火",
      "水",
      "木",
      "金",
      "土",
      "日",
    ];
    return week[weekIndex - 1];
  }
}
