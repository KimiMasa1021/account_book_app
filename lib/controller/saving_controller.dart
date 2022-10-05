import 'package:account_book_app/repository/saving_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/saving_state.dart';

class SavingController extends StateNotifier<List<SavingState>> {
  final Reader reader;
  SavingController(this.reader) : super([]) {
    reader(savingRepositoryProvider).feachSaving().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }

  Future<void> initTarget(String target, int targetPrice) async {
    reader(savingRepositoryProvider).initTarget(target, targetPrice);
  }

  Future<void> addSaving(DateTime registedTime, int price, String memo) async {
    await reader(savingRepositoryProvider).addSaving(registedTime, price, memo);
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    debugPrint(state[0].memo);
  }
}