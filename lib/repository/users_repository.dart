import 'dart:io';

import 'package:account_book_app/provider/firebase_storage.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<String> uploadImage(File image);
  Future<void> saveImageUrl(String url);
  Future<void> reName(String newName);
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
    try {
      if (uid.contains("//")) {
        return null;
      }
      final docSnapshot =
          collectionReference!.doc(uid).withConverter<UsersState>(
                fromFirestore: (snapshot, _) =>
                    UsersState.fromJson(snapshot.data()!),
                toFirestore: (data, _) => data.toJson(),
              );
      final docSnap = await docSnapshot.get();
      final result = docSnap.data();
      return result;
    } on FirebaseAuthException {
      return null;
    }
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

  @override
  Future<String> uploadImage(File image) async {
    final date = DateTime.now().toString();

    String uploadName = "$date$userId.png";
    final storageRef = ref.read(firebaseStorageProvider).ref().child(
          'Image/$uploadName',
        );

    await storageRef.putFile(image);
    return await storageRef.getDownloadURL();
  }

  @override
  Future<void> saveImageUrl(String url) async {
    await collectionReference!.doc(userId).update({
      'img': url,
    });
  }

  @override
  Future<void> reName(String newName) async {
    try {
      await collectionReference!.doc(userId).update({
        'name': newName,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());
    }
  }
}
