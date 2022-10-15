import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/provider/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';

final savingRepositoryProvider =
    Provider<SavingRepository>((ref) => SavingRepoositoryImple(ref));

abstract class SavingRepository {
  Future<void> initTarget(String target, int targetPrice);
  Future<void> addSaving(DateTime registedTime, int price, String memo);
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving();
}

class SavingRepoositoryImple implements SavingRepository {
  final Ref ref;
  CollectionReference? targetCollectionReference;
  CollectionReference? savingCollectionReference;
  User? user;

  SavingRepoositoryImple(this.ref) {
    targetCollectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    user = ref.read(firebaseAuthProvider).currentUser;
    savingCollectionReference = ref
        .read(firebaseFireStoreProvider)
        .collection("users")
        .doc(user!.uid)
        .collection("saving");
  }

  @override
  Future<void> initTarget(String target, int targetPrice) async {
    User? user = ref.read(firebaseAuthProvider).currentUser;
    try {
      await targetCollectionReference?.doc(user?.uid).set(
        {
          'target': target,
          'targetPrice': targetPrice,
        },
        SetOptions(merge: true),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> addSaving(DateTime registedTime, int price, String memo) async {
    SavingState savingState = SavingState(
      createdAt: DateTime.now(),
      registeTime: registedTime,
      price: price,
      memo: memo,
    );
    try {
      await savingCollectionReference?.add(savingState.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving() async* {
    final stateRef = savingCollectionReference!
        .orderBy("registeTime")
        .withConverter<SavingState>(
          fromFirestore: (snapshot, _) =>
              SavingState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
