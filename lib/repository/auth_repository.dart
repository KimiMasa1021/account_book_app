import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref.read));

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
  Stream<User?> get authStateChange;
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
  Stream<User?> get authStateChange =>
      _reader(firebaseAuthProvider).authStateChanges();

  @override
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await _reader(firebaseAuthProvider).signInWithEmailAndPassword(
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

  @override
  Future<void> saveUserData(String name) async {
    User? user = _reader(firebaseAuthProvider).currentUser;
    try {
      await storeCollectionReference?.doc(user?.uid).set({
        'uid': user?.uid,
        'email': user?.email,
        'name': name,
        'genre': {
          'education': '教育費',
          'food': '食費',
          'others': 'その他',
          'beauty': '美容',
          'convenience': 'コンビニ',
          'transportation': '交通費',
        },
        'genle2': {
          'salary': '給料',
          'extraIncome': '副収入',
          'others': 'その他',
          'pocketMoney': 'お小遣い',
          'bonus': 'ボーナス',
        },
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future signOut() async {
    try {
      await _reader(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return _reader(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
