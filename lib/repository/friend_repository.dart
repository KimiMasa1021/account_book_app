import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/enums.dart';
import '../model/user/users_state.dart';
import '../provider/firebase/firebase_auth_provider.dart';
import '../provider/firebase/firebase_firestore_provider.dart';

final friendRepositoryProvider =
    Provider<FriendRepository>((ref) => FriendRepositoryImple(ref));

abstract class FriendRepository {
  Future<FrendRequestResult> addFriend(String user1Uid, String user2Uid);
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends();
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachTargetMembers(
      List<String> members);
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
  Future<FrendRequestResult> addFriend(String user1Uid, String user2Uid) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
            'https://asia-northeast1-account-book-app-af1e7.cloudfunctions.net/friendProcess'),
      );
      request.body = json.encode({
        "process": "フレンド登録",
        "user1": {"uid": user1Uid},
        "user2": {"uid": user2Uid}
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final log = await response.stream.bytesToString();
        switch (log) {
          case "success":
            return FrendRequestResult.success;
          case "already_registered":
            return FrendRequestResult.alreadyRegistered;
          case "error":
            return FrendRequestResult.error;
          case "injustice":
            return FrendRequestResult.injustice;
          case "not_exist":
            return FrendRequestResult.notExist;
          default:
            return FrendRequestResult.error;
        }
      } else {
        return FrendRequestResult.error;
      }
    } catch (e) {
      debugPrint(e.toString());
      return FrendRequestResult.error;
    }
  }
}
