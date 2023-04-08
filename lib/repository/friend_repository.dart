import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/user/users_state.dart';
import '../provider/firebase/firebase_auth_provider.dart';
import '../provider/firebase/firebase_firestore_provider.dart';

final friendRepositoryProvider =
    Provider<FriendRepository>((ref) => FriendRepositoryImple(ref));

abstract class FriendRepository {
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends();
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachTargetMembers(
      List<String> members);
  Future<UsersState?> feachSearchUser(String uid);
}

class FriendRepositoryImple implements FriendRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  User? user;

  FriendRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    user = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends() async* {
    final stateRef = collectionReference!
        .where("friends", arrayContains: user!.uid)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachTargetMembers(
    List<String> members,
  ) async* {
    final stateRef = collectionReference!
        .where("uid", whereIn: members)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Future<UsersState?> feachSearchUser(String uid) async {
    try {
      final stateRef = collectionReference!
          .where("uid", isEqualTo: uid)
          .withConverter<UsersState>(
            fromFirestore: (snapshot, _) =>
                UsersState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );
      final aa = await stateRef.get();
      if (aa.docs.isEmpty) {
        return null;
      } else {
        return aa.docs.first.data();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
