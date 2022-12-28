import 'dart:async';
import 'package:account_book_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<bool> signInWithGoogle() async {
    try {
      final credential =
          await ref.read(authRepositoryProvider).signInWithGoogle();

      if (credential == null) return false;
      if (credential.additionalUserInfo!.isNewUser) {
        await ref.read(authRepositoryProvider).saveUsesrData(credential);
      }
      return credential.additionalUserInfo!.isNewUser;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<void> signOut(Function() function) async {
    await ref.read(authRepositoryProvider).signOut();
    function();
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }
}
