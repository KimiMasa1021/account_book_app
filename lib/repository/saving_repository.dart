import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/provider/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/saving_state.dart';
import '../provider/firebase_auth_provider.dart';

final savingRepositoryProvider =
    Provider<SavingRepository>((ref) => SavingRepoositoryImple(ref));

abstract class SavingRepository {
  Future<void> initTarget(
      String target, int targetPrice, String groupName, List membersList);
  Future<void> addSaving(
      DateTime registedTime, int price, String memo, String uid, String member);
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachSaving();
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachList(String? uid);
  Future<void> addMember(
      String docId, List<String> newList, List<String> oldList);
  Future<void> seceesion(String docId, List<String> list);
}

class SavingRepoositoryImple implements SavingRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  CollectionReference? collectionReference2;

  User? user;

  SavingRepoositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("saving");
    user = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> initTarget(
    String target,
    int targetPrice,
    String groupName,
    List membersList,
  ) async {
    try {
      final fff = await collectionReference!.add(
        {
          'target': target,
          'targetPrice': targetPrice,
          'groupName': groupName,
          'members': membersList,
          'registeTime': DateTime.now(),
        },
      );

      await collectionReference!.doc(fff.id).set(
        {
          'id': fff.id,
        },
        SetOptions(merge: true),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> addSaving(
    DateTime registedTime,
    int price,
    String memo,
    String uid,
    String member,
  ) async {
    SavingState savingState = SavingState(
      registeTime: registedTime,
      price: price,
      memo: memo,
      member: member,
    );
    try {
      collectionReference2 = ref
          .read(firebaseFireStoreProvider)
          .collection("saving")
          .doc(uid)
          .collection("list");
      await collectionReference2?.add(savingState.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> addMember(
    String docId,
    List<String> newList,
    List<String> oldList,
  ) async {
    try {
      collectionReference =
          ref.read(firebaseFireStoreProvider).collection("saving");

      await collectionReference?.doc(docId).update({
        'members': [...oldList, ...newList],
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> seceesion(
    String docId,
    List<String> list,
  ) async {
    try {
      collectionReference =
          ref.read(firebaseFireStoreProvider).collection("saving");
      final newList = list.where((e) => e != user!.uid).toList();

      await collectionReference?.doc(docId).update({
        'members': newList,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachSaving() async* {
    final stateRef = collectionReference!
        .where('members', arrayContains: user!.uid)
        .orderBy('registeTime', descending: false)
        .withConverter<TargetState>(
          fromFirestore: (snapshot, _) =>
              TargetState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Stream<List<QueryDocumentSnapshot<SavingState>>> feachList(
    String? uid,
  ) async* {
    collectionReference2 = ref
        .read(firebaseFireStoreProvider)
        .collection("saving")
        .doc(uid)
        .collection("list");
    final stateRef = collectionReference2!.withConverter<SavingState>(
      fromFirestore: (snapshot, _) => SavingState.fromJson(snapshot.data()!),
      toFirestore: (data, _) => data.toJson(),
    );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
