import 'dart:io';
import 'package:account_book_app/provider/firebase/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/user/users_state.dart';
import '../provider/firebase/firebase_firestore_provider.dart';
import '../view_model/auth_controller.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>((ref) => GenreRepositoryImple(ref));

abstract class UsersRepository {
  Stream<UsersState?> feachGenreList();
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
