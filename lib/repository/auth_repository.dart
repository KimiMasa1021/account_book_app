import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(ref.read));

abstract class AuthRepository {
  //email passwordでログイン
  Future<String?> signInWithEmail(String email, String password);
  //email password name で新規登録
  Future<String?> signUp(String email, String password, String name);
  //新規登録の後にuid email name をstoreに登録
  Future<void> saveUserData(String naem);
  //サインアウト
  Future signOut();
  //ログイン状態を監視
  Stream<User?> get authStateChanges;
  //ログイン中のユーザーのデータの取得
  User? getCurrentUser();
}

class AuthRepositoryImpl implements AuthRepository {
  CollectionReference? storeCollectionReference;
  final Reader _reader;
  AuthRepositoryImpl(this._reader) {
    storeCollectionReference =
        _reader(firebaseFireStoreProvider).collection("users");
  }

  @override
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      _reader(firebaseAuthProvider).signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String?> signUp(String email, String password, String name) async {
    try {
      await _reader(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> saveUserData(String name) async {
    User? user = _reader(firebaseAuthProvider).currentUser;
    try {
      await storeCollectionReference?.add({
        'uid': user?.uid,
        'email': user?.email,
        'name': name,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future signOut() {
    throw UnimplementedError();
  }

  @override
  Stream<User?> get authStateChanges =>
      _reader(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    try {
      return _reader(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
