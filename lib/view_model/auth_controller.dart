import 'dart:async';

import 'package:account_book_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController extends StateNotifier<User?> {
  final Reader _read;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }
  @override
  User? get state => _read(authRepositoryProvider).getCurrentUser();

  Future<void> signIn(String email, String password) async {
    try {
      if (!validate2(email, password)) return showToast("no-data");

      final flg =
          await _read(authRepositoryProvider).signInWithEmail(email, password);
      if (flg != null) {
        showToast(flg);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      if (!validate(email, password, name)) return showToast("no-data");

      final flg =
          await _read(authRepositoryProvider).signUp(email, password, name);
      if (flg == null) {
        await _read(authRepositoryProvider).saveUserData(name);
      } else {
        showToast(flg);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  void showToast(String flg) {
    late String msg;
    switch (flg) {
      case "email-already-in-use":
        msg = "そのメールアドレスは既に使われています。";
        break;
      case "invalid-email":
        msg = "そのメールアドレスは登録済みです";
        break;
      case "operation-not-allowed":
        msg = "有効なユーザーではありません。";
        break;
      case "weak-password":
        msg = "パスワードが短すぎます。";
        break;
      case "no-data":
        msg = "すべて必須項目です。";
        break;
      default:
        msg = "";
        return;
    }
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool validate(String email, String password, String name) {
    if (email.isEmpty) return false;
    if (password.isEmpty) return false;
    if (name.isEmpty) return false;

    return true;
  }

  bool validate2(String email, String password) {
    if (email.isEmpty) return false;
    if (password.isEmpty) return false;

    return true;
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }
}
