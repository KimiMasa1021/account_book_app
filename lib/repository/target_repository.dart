import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/provider/firebase/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/firebase/firebase_auth_provider.dart';

final targetRepositoryProvider =
    Provider<TargetRepository>((ref) => TargetRepositoryImple(ref));

abstract class TargetRepository {
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachTarget();
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving();
  Future<void> addSaving(SavingState state);
}

class TargetRepositoryImple implements TargetRepository {
  final Ref ref;
  CollectionReference? targetCollectionReference;

  User? user;

  TargetRepositoryImple(this.ref) {
    targetCollectionReference =
        ref.read(firebaseFireStoreProvider).collection("targets");

    user = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachTarget() async* {
    try {
      final stateRef = targetCollectionReference!
          .where("members", arrayContains: user!.uid)
          .orderBy("registeTime")
          .withConverter<TargetState>(
            fromFirestore: (snapshot, _) =>
                TargetState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

      yield* stateRef.snapshots().map((doc) => doc.docs);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving() async* {
    try {
      final stateRef = ref
          .read(firebaseFireStoreProvider)
          .collectionGroup("saving")
          .orderBy(
            "createdAt",
            descending: true,
          )
          .withConverter<SavingState>(
            fromFirestore: (snapshot, _) =>
                SavingState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

      yield* stateRef.snapshots().map((doc) => doc.docs);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> addSaving(SavingState state) async {
    try {
      await targetCollectionReference!
          .doc(state.productId)
          .collection("saving")
          .add(state.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }
}
