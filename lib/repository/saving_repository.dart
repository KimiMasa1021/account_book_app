import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/provider/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';

final savingRepositoryProvider =
    Provider<SavingRepository>((ref) => SavingRepoositoryImple(ref));

abstract class SavingRepository {
  Future<void> initTarget(
      String target, int targetPrice, String groupName, List membersList);
  // Future<void> addSaving(DateTime registedTime, int price, String memo);
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachSaving();
}

class SavingRepoositoryImple implements SavingRepository {
  final Ref ref;
  CollectionReference? collectionReference;
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
      debugPrint("レポジトリー");
      await collectionReference!.add(
        {
          'target': target,
          'targetPrice': targetPrice,
          'groupName': groupName,
          'members': membersList,
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("あああああああああ" + e.code);
    }
  }

  // @override
  // Future<void> addSaving(DateTime registedTime, int price, String memo) async {
  //   SavingState savingState = SavingState(
  //     createdAt: DateTime.now(),
  //     registeTime: registedTime,
  //     price: price,
  //     memo: memo,
  //   );
  //   try {
  //     await savingCollectionReference?.add(savingState.toJson());
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.code);
  //   }
  // }

  @override
  Stream<List<QueryDocumentSnapshot<TargetState>>> feachSaving() async* {
    final stateRef = collectionReference!
        .where('members', arrayContains: user!.uid)
        .withConverter<TargetState>(
          fromFirestore: (snapshot, _) =>
              TargetState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
