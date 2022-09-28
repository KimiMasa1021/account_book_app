import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/account_state.dart';
import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepositoryImple(ref.read));

abstract class AccountRepository {
  Future<bool> addAccount(
      DateTime registeTime, String type, int price, String memo);
  Stream<List<QueryDocumentSnapshot<AccountState>>> test();
}

class AccountRepositoryImple implements AccountRepository {
  final Reader reader;
  CollectionReference? accountCollectionReference;
  User? user;
  AccountRepositoryImple(this.reader) {
    user = reader(firebaseAuthProvider).currentUser;
    accountCollectionReference = reader(firebaseFireStoreProvider)
        .collection("users")
        .doc(user!.uid)
        .collection("account");
  }

  @override
  Future<bool> addAccount(
      DateTime registeTime, String type, int price, String memo) async {
    AccountState setValue = AccountState(
      createdAt: DateTime.now(),
      registeTime: registeTime,
      type: type,
      price: price,
      memo: memo,
    );

    try {
      await accountCollectionReference?.add({
        'createdAt': setValue.createdAt,
        'registeTime': setValue.registeTime,
        'type': setValue.type,
        'price': setValue.price,
        'memo': setValue.memo,
      });
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return false;
    }
  }

  @override
  Stream<List<QueryDocumentSnapshot<AccountState>>> test() async* {
    final stateRef = accountCollectionReference!
        .orderBy("registeTime")
        .withConverter<AccountState>(
          fromFirestore: (snapshot, _) =>
              AccountState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
