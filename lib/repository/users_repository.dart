import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/users_state.dart';

import '../provider/firebase_firestore_provider.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>((ref) => GenreRepositoryImple(ref));

abstract class UsersRepository {
  Stream<UsersState?> feachGenreList();
  Future<UsersState?> searchUser(String uid);
  Future<void> makeFriend(String uid, List friendList, List myList);
}

class GenreRepositoryImple implements UsersRepository {
  CollectionReference? collectionReference;
  final Ref ref;
  String? userId;
  GenreRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<UsersState?> feachGenreList() async* {
    final stateRef = collectionReference!.doc(userId).withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    yield* stateRef.snapshots().map((snap) => snap.data());
  }

  @override
  Future<UsersState?> searchUser(String uid) async {
    final docSnapshot = collectionReference!.doc(uid).withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    final docSnap = await docSnapshot.get();
    final result = docSnap.data();
    return result;
  }

  @override
  Future<void> makeFriend(String uid, List friendList, List myList) async {
    await collectionReference!.doc(uid).update({
      'friends': friendList,
    });
    await collectionReference!.doc(userId).update({
      'friends': myList,
    });
  }
}
//　読み取ったuidと取得したデータのuidが等しかったら有効なQRコード => 「〇〇さんとフレンドになりました。」
//  nullもしくはuidがなかったら  => 「ユーザーが存在しないか有効なQRコードではありません。」
//  friendsのリストに既に自分のuidがあったら => 「既にフレンドに追加されています」


