import 'package:account_book_app/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountController extends StateNotifier {
  final Reader reader;
  AccountController(this.reader) : super(null);

  Future<bool> addAccount(
      DateTime registeTime, String type, int price, String memo) async {
    try {
      final flg = reader(accountRepositoryProvider)
          .addAccount(registeTime, type, price, memo);
      return flg;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
