import 'dart:async';
import 'package:account_book_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/saving/tags_state.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
        (ref) => AuthController(ref));

class AuthController extends StateNotifier<User?> {
  final Ref ref;

  StreamSubscription<User?>? authStateChangesSubscription;

  AuthController(this.ref) : super(null) {
    authStateChangesSubscription?.cancel();
    authStateChangesSubscription = ref
        .read(authRepositoryProvider)
        .authStateChange
        .listen((user) => state = user);
  }

  Future<String?> signInWithGoogle() async {
    try {
      final credential =
          await ref.read(authRepositoryProvider).signInWithGoogle();

      if (credential == null) return null;
      if (credential.additionalUserInfo!.isNewUser) {
        await ref.read(authRepositoryProvider).saveUsesrData(credential);
      }
      return credential.user?.uid;
    } catch (e) {
      debugPrint("ログイン失敗$e");
      return null;
    }
  }

  Future<void> branchBySignin(
    String? authFlg,
    List<Tags> tags,
    Function() emptyTagFunc,
    Function() notEmptyTagFunc,
  ) async {
    if (authFlg != null && tags.isEmpty) {
      emptyTagFunc();
    } else {
      notEmptyTagFunc();
    }
  }

  Future<void> signOut(Function() function) async {
    await ref.read(authRepositoryProvider).signOut();
    function();
  }

  Future<void> deryFuture(Function() function) async {
    await Future.delayed(const Duration(seconds: 1));
    function();
  }

  @override
  void dispose() {
    authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void shwoToast(String msg) {
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
}
