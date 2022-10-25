import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/genre_state.dart';
import '../provider/firebase_auth_provider.dart';
import '../provider/firebase_firestore_provider.dart';

final GenreRepositoryProvider = Provider((ref) => GenreRepositoryImple(ref));

abstract class GenreRepository {
  Stream<List<QueryDocumentSnapshot<GenreState>>> fetchIncome();
  Stream<List<QueryDocumentSnapshot<GenreState>>> fetchExpend();
  Future<void> deleteIncome(String docId);
  Future<void> deleteExpend(String docId);
  Future<void> updateSeq(GenreState newState, GenreState oldState);
}

class GenreRepositoryImple implements GenreRepository {
  final Ref ref;
  CollectionReference? incomeCollectionReference;
  CollectionReference? expendCollectionReference;
  User? user;

  GenreRepositoryImple(this.ref) {
    user = ref.read(firebaseAuthProvider).currentUser;
    incomeCollectionReference = ref
        .read(firebaseFireStoreProvider)
        .collection("users")
        .doc(user!.uid)
        .collection("income");
    expendCollectionReference = ref
        .read(firebaseFireStoreProvider)
        .collection("users")
        .doc(user!.uid)
        .collection("expend");
  }
  @override
  Stream<List<QueryDocumentSnapshot<GenreState>>> fetchIncome() async* {
    final stateRef = incomeCollectionReference!
        .orderBy("seq")
        .withConverter<GenreState>(
          fromFirestore: (snapshot, _) => GenreState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Stream<List<QueryDocumentSnapshot<GenreState>>> fetchExpend() async* {
    final stateRef = expendCollectionReference!
        .orderBy("seq")
        .withConverter<GenreState>(
          fromFirestore: (snapshot, _) => GenreState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Future<void> deleteIncome(String docId) async {
    try {
      await incomeCollectionReference!.doc(docId).delete();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> deleteExpend(String docId) async {
    try {
      await expendCollectionReference!.doc(docId).delete();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> updateSeq(GenreState newState, GenreState oldState) async {
    try {
      await expendCollectionReference!
          .doc(newState.docId)
          .update({'seq': oldState.seq});
      await expendCollectionReference!
          .doc(oldState.docId)
          .update({'seq': newState.seq});
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }
}
