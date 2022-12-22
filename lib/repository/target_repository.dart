import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/provider/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/firebase_auth_provider.dart';

final targetRepositoryProvider =
    Provider<TargetRepository>((ref) => TargetRepositoryImple(ref));

abstract class TargetRepository {
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachTarget();
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving();
}

class TargetRepositoryImple implements TargetRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  User? user;

  TargetRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("targets");
    user = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachTarget() async* {
    final stateRef = collectionReference!
        .where("members", arrayContains: user!.uid)
        .orderBy("registeTime")
        .withConverter<TargetState>(
          fromFirestore: (snapshot, _) =>
              TargetState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachSaving() async* {
    final stateRef = ref
        .read(firebaseFireStoreProvider)
        .collectionGroup("saving")
        .orderBy("registeTime")
        .withConverter<SavingState>(
          fromFirestore: (snapshot, _) =>
              SavingState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
