import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/target/target_state.dart';
import '../provider/firebase/firebase_auth_provider.dart';
import '../provider/firebase/firebase_firestore_provider.dart';

final targetInitRepositoryProvider =
    Provider<TargetInitRepository>((ref) => TargetInitRepositoryImpl(ref));

abstract class TargetInitRepository {
  Future<void> createTarget(TargetState state);
  Future<void> updateTarget(TargetState state, String docId);
  Future<void> updateMember(List<String> member, String docId);
  Future<void> updateTotalSaving(int newTotalSaving, String docId);
}

class TargetInitRepositoryImpl implements TargetInitRepository {
  CollectionReference? collectionReference;
  User? user;
  final Ref ref;

  TargetInitRepositoryImpl(this.ref) {
    user = ref.read(firebaseAuthProvider).currentUser;
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("targets");
  }
  @override
  Future<void> createTarget(TargetState state) async {
    try {
      await collectionReference!.add(state.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> updateTarget(TargetState state, String docId) async {
    try {
      await collectionReference!.doc(docId).update(state.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> updateMember(List<String> member, String docId) async {
    try {
      await collectionReference!.doc(docId).update({
        "members": member,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> updateTotalSaving(int newTotalSaving, String docId) async {
    try {
      await collectionReference!.doc(docId).update({
        "totalSaving": newTotalSaving,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }
}
