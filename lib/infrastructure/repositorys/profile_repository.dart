import 'dart:async';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entity/profile/profile.dart';
import '../../domain/repository/profile_repository_base.dart';

final profileRepository = Provider((ref) => ProfileRepository(ref));

class ProfileRepository implements ProfileRepositoryBase {
  ProfileRepository(this.ref);

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final Ref ref;
  late Stream<DocumentSnapshot<Profile>>? _stream;
  late StreamSubscription? _streamListener;

  @override
  void subscribeStream(
    void Function(Profile) onCompleted,
  ) {
    try {
      _stream = _db
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .withConverter<Profile>(
            fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          )
          .snapshots();
      _streamListener = _stream?.listen((event) {
        if (event.data() != null) {
          onCompleted(event.data()!);
        }
      });
    } on Exception catch (e) {
      return;
    }
  }

  @override
  Future<Result<bool>> saveUsesrData(UserCredential credential) async {
    try {
      await _db.collection("users").doc(credential.user!.uid).set(
        {
          "name": credential.user?.displayName ?? "名無し",
          "uid": credential.user!.uid,
          "email": credential.user!.email,
          "img": credential.user?.photoURL ?? "",
        },
        SetOptions(merge: true),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value(true);
  }

  @override
  Future<Result<bool>> initializeTag(List<String> tags) async {
    try {
      await _db.collection("users").doc(_auth.currentUser?.uid).set(
        {
          "tags": tags,
        },
        SetOptions(merge: true),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value(true);
  }
}
