import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/add_page_state.dart';

import '../provider/firebase_firestore_provider.dart';

final addPageRepositoryProvider =
    Provider<AddPageRepository>((ref) => AddPageRepositoryImple(ref.read));

abstract class AddPageRepository {
  // Future<List<QueryDocumentSnapshot<AddPageState>>> fechGenreList();
  Stream<List<QueryDocumentSnapshot<AddPageState>>> testList();
}

class AddPageRepositoryImple implements AddPageRepository {
  CollectionReference? storeCollectionReference;
  final Reader _reader;
  String? userId;
  AddPageRepositoryImple(this._reader) {
    storeCollectionReference =
        _reader(firebaseFireStoreProvider).collection("users");
    userId = _reader(authControllerProvider)!.uid;
  }
  // @override
  // Future<List<QueryDocumentSnapshot<AddPageState>>> fechGenreList() async {
  //   final stateRef = storeCollectionReference!
  //       .where("uid", isEqualTo: userId)
  //       .withConverter<AddPageState>(
  //         fromFirestore: (snapshot, _) =>
  //             AddPageState.fromJson(snapshot.data()!),
  //         toFirestore: (data, _) => data.toJson(),
  //       );

  //   final snapshot = await stateRef.get();

  //   return snapshot.docs;
  // }

  @override
  Stream<List<QueryDocumentSnapshot<AddPageState>>> testList() async* {
    final stateRef = storeCollectionReference!
        .where("uid", isEqualTo: userId)
        .withConverter<AddPageState>(
          fromFirestore: (snapshot, _) =>
              AddPageState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((snap) => snap.docs);
  }
}
