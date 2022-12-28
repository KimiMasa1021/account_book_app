import 'package:account_book_app/model/tags_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref));

abstract class AuthRepository {
  Future signOut();
  Stream<User?> get authStateChange;
  Future<UserCredential?> signInWithGoogle();
  Future<void> signInWithApple();
  Future<void> saveUsesrData(UserCredential credential);
}

class AuthRepositoryImpl implements AuthRepository {
  CollectionReference? storeCollectionReference;
  CollectionReference? expendCollectionReference;
  CollectionReference? incomeCollectionReference;
  User? user;
  final Ref ref;

  AuthRepositoryImpl(this.ref) {
    user = ref.read(firebaseAuthProvider).currentUser;

    storeCollectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
  }

  @override
  Stream<User?> get authStateChange =>
      ref.read(firebaseAuthProvider).authStateChanges();

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]).signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth == null) {
        return null;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return null;
    }
  }

  @override
  Future<void> saveUsesrData(UserCredential credential) async {
    try {
      await storeCollectionReference!.doc(credential.user!.uid).set({
        "friends": [],
        "name": credential.user?.displayName ?? "名無しさん",
        "uid": credential.user!.uid,
        "email": credential.user!.email,
        "img": credential.user?.photoURL ?? "",
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> signInWithApple() async {}

  @override
  Future signOut() async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
