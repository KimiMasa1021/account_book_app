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
  // Future<List<UsersState>> feachTargetsFriends(
  //   List<String> friends,
  // );
}

class FriendsListRepositoryImple implements FriendsListRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  String? userId;

  FriendsListRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends() async* {
    debugPrint(userId);

    final stateRef = collectionReference!
        .where('friends', arrayContains: userId)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  // @override
  // Future<List<UsersState>> feachTargetsFriends(
  //   List<String> friends,
  // ) async {
  //   final stateRef = collectionReference!
  //       .where('uid', whereIn: friends)
  //       .withConverter<UsersState>(
  //         fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
  //         toFirestore: (data, _) => data.toJson(),
  //       );
  //   final querySnap = await stateRef.get();
  //   final result = querySnap.docs.map((e) => e.data()).toList();
  //   return result;
  // }
}
