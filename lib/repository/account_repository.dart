import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/account_state.dart';
import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepositoryImple(ref));

abstract class AccountRepository {
  Future<void> addAccount(
      DateTime registeTime, String type, int price, String memo);
  Stream<List<QueryDocumentSnapshot<AccountState>>> test();
}

class AccountRepositoryImple implements AccountRepository {
  final Ref ref;
  CollectionReference? accountCollectionReference;
  User? user;
  AccountRepositoryImple(this.ref) {
    user = ref.read(firebaseAuthProvider).currentUser;
    accountCollectionReference = ref
        .read(firebaseFireStoreProvider)
        .collection("users")
        .doc(user!.uid)
        .collection("account");
  }

  @override
  Future<void> addAccount(
      DateTime registeTime, String type, int price, String memo) async {
    AccountState setValue = AccountState(
      createdAt: DateTime.now(),
      registeTime: registeTime,
      type: type,
      price: price,
      memo: memo,
    );

    try {
      await accountCollectionReference?.add(setValue.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
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
