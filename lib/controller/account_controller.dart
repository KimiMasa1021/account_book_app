import 'package:account_book_app/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;

import '../model/account_state.dart';

class AccountController extends StateNotifier<AsyncValue<List<AccountState>>> {
  final Ref ref;
  AccountController(this.ref) : super(const AsyncLoading()) {
    ref.read(accountRepositoryProvider).test().listen((data) {
      state = AsyncData(
        data.map((doc) => doc.data()).toList(),
      );
    });
  }

  Future<void> addAccount(
    DateTime registeTime,
    String type,
    int price,
    String memo,
    Function() function,
  ) async {
    try {
      await ref
          .read(accountRepositoryProvider)
          .addAccount(registeTime, type, price, memo);
      function();
    } catch (e) {
      debugPrint(e.toString());
    }
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  String pFormat(int price) {
    final newPrice = NumberFormat("#,###").format(price);
    return newPrice;
  }
}
