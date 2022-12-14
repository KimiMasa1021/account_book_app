import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';
import '../provider/general_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref));

abstract class AuthRepository {
  //email passwordでログイン
  Future<String?> signInWithEmail(String email, String password);
  //email password name で新規登録
  Future<void> signUp(String email, String password, String name);
  //新規登録の後にuid email name をstoreに登録
  // Future<void> saveUserData(String name, UserCredential user);
  Future signOut();
  Stream<User?> get authStateChange;
  User? getCurrentUser();
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
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    try {
      final result =
          await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
      result.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }
  // @override
  // Future<void> saveUserData(String name, UserCredential user) async {
  //   try {
  //     final uid = user.user!.uid;
  //     final email = user.user!.email;
  //     expendCollectionReference = ref
  //         .read(firebaseFireStoreProvider)
  //         .collection("users")
  //         .doc(uid)
  //         .collection("expend");
  //     incomeCollectionReference = ref
  //         .read(firebaseFireStoreProvider)
  //         .collection("users")
  //         .doc(uid)
  //         .collection("income");
  //     final test = await expendCollectionReference!.get();
  //     if (test.docs.isEmpty) {
  //       await storeCollectionReference?.doc(uid).set({
  //         'uid': uid,
  //         'email': email,
  //         'name': name,
  //         'friends': [],
  //         "img": "",
  //       });
  //       final List<Map<String, dynamic>> income = [
  //         {"name": "給料", "seq": 0},
  //         {"name": "ボーナス", "seq": 1},
  //         {"name": "お小遣い", "seq": 2},
  //         {"name": "副業", "seq": 3},
  //       ];
  //       final List<Map<String, dynamic>> expend = [
  //         {"name": "食費", "seq": 0},
  //         {"name": "交通費", "seq": 1},
  //         {"name": "プレゼント", "seq": 2},
  //         {"name": "光熱費", "seq": 3},
  //       ];
  //       for (int i = 0; i < income.length; i++) {
  //         await incomeCollectionReference!.add(income[i]);
  //       }
  //       for (int i = 0; i < expend.length; i++) {
  //         await expendCollectionReference!.add(expend[i]);
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.code);
  //   }
  // }

  @override
  Future signOut() async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  @override
  User? getCurrentUser() {
    try {
      // ref.read(firebaseAuthProvider).currentUser!.emailVerified;
      return ref.read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
