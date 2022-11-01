import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/users_state.dart';
import '../provider/firebase_firestore_provider.dart';

final friendsListRepositoryProvider =
    Provider<FriendsListRepository>((ref) => FriendsListRepositoryImple(ref));

abstract class FriendsListRepository {
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends();
}

class FriendsListRepositoryImple implements FriendsListRepository {
  final Ref ref;
  CollectionReference? collectionReference;

  FriendsListRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends() async* {
    final uid = ref.watch(usersControllerProvider)!.uid;
    debugPrint(uid);

    final stateRef = collectionReference!
        .where('friends', arrayContains: uid)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }
}
