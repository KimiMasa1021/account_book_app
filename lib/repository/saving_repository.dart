import 'package:account_book_app/provider/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';

final savingRepositoryProvider =
    Provider<SavingRepository>((ref) => SavingRepoositoryImple(ref.read));

abstract class SavingRepository {
  Future<void> initTarget(String target, int targetPrice);
}

class SavingRepoositoryImple implements SavingRepository {
  final Reader reader;
  CollectionReference? targetCollectionReference;

  SavingRepoositoryImple(this.reader) {
    targetCollectionReference =
        reader(firebaseFireStoreProvider).collection("users");
  }

  @override
  Future<void> initTarget(String target, int targetPrice) async {
    User? user = reader(firebaseAuthProvider).currentUser;
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
}
