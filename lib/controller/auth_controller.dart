import 'dart:async';

import 'package:account_book_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController extends StateNotifier<User?> {
  final Ref ref;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this.ref) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = ref
        .read(authRepositoryProvider)
        .authStateChange
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  Future<void> signIn(
      String email, String password, ValueNotifier<bool> loading) async {
    try {
      if (!validate2(email, password)) return showToast("no-data");

      final flg = await ref
          .read(authRepositoryProvider)
          .signInWithEmail(email, password);
      loading.value = false;
      if (flg != null) {
        showToast(flg);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      await ref.read(authRepositoryProvider).signUp(email, password, name);
    } catch (e) {
      throw e.toString();
    }
  }

  // Future<void> signUpWithGoogle(ValueNotifier<bool> loading) async {
  //   try {
  //     final credential =
  //         await ref.read(authRepositoryProvider).signInWithGoogle();
  //     if (credential == null) {
  //       return;
  //     }
  //     // await ref.read(authRepositoryProvider).saveUserData(
  //     //       credential.user!.displayName!,
  //     //       credential,
  //     //     );
  //     loading.value = false;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Future<void> signInWithGoogle(ValueNotifier<bool> loading) async {
  //   try {
  //     await ref.read(authRepositoryProvider).signInWithGoogle();

  //     loading.value = false;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<void> signOut(Function() function) async {
    await ref.read(authRepositoryProvider).signOut();
    function();
  }

  void showToast(String flg) {
    late String msg;
    switch (flg) {
      case "email-already-in-use":
        msg = "そのメールアドレスは既に使われています。";
        break;
      case "invalid-email":
        msg = "そのメールアドレスは無効です";
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
      case "wrong-password":
        msg = "間違ったパスワードです。";
        break;
      case "user-disabled":
        msg = "メールアドレスが無効です。";
        break;
      case "user-not-found":
        msg = "そのメールアドレスは登録されていません。";
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
      fontSize: 16.0,
    );
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

  Future<void> addGenre(String genre, bool ie) async {
    // if (ie == true) {
    //   ref.read(authRepositoryProvider).addGenre(genre);
    // } else {
    //   ref.read(authRepositoryProvider).addGenre2(genre);
    // }
  }
}
