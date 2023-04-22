import 'dart:async';

import 'package:account_book_app/domain/profile/models/profile.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileRepository = Provider((ref) => ProfileRepository());

class ProfileRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  late Stream<DocumentSnapshot<Profile>>? _stream;
  late StreamSubscription? _streamListener;

  void subscribeStream(
    void Function(Profile) onCompleted,
  ) {
    _stream = _db
        .collection('users')
        .doc("")
        .withConverter<Profile>(
          fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        )
        .snapshots();
    _streamListener = _stream!.listen((event) {
      onCompleted(event.data()!);
    });
  }

  Future<Result<bool>> saveUsesrData(UserCredential credential) async {
    try {
      await _db.doc(credential.user!.uid).set({
        "name": credential.user?.displayName ?? "名無し",
        "uid": credential.user!.uid,
        "email": credential.user!.email,
        "img": credential.user?.photoURL ?? "",
        "friends": [],
      });
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value(true);
  }
}
