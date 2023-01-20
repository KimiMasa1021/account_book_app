import 'dart:async';
import 'package:account_book_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    authStateChangesSubscription?.cancel();
    super.dispose();
  }
}
