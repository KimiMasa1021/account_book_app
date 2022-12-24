import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/users_state.dart';
import '../provider/firebase_firestore_provider.dart';

final allUsersRepositoryProvider =
    Provider<AllUsersRepository>((ref) => AllUsersRepositoryImple(ref));

abstract class AllUsersRepository {
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends();
  // Future<List<UsersState>> feachTargetsFriends(
  //   List<String> friends,
  // );
}

class AllUsersRepositoryImple implements AllUsersRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  String? userId;

  AllUsersRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends() async* {
    final stateRef = collectionReference!
        // .where('friends', arrayContains: userId)
        .withConverter<UsersState>(
      fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
      toFirestore: (data, _) => data.toJson(),
    );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
