import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/users_state.dart';

import '../provider/firebase_firestore_provider.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>((ref) => GenreRepositoryImple(ref));

abstract class UsersRepository {
  // Future<List<QueryDocumentSnapshot<AddPageState>>> fechGenreList();
  //ジャンル一覧の取得
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachGenreList();
}

class GenreRepositoryImple implements UsersRepository {
  CollectionReference? storeCollectionReference;
  final Ref ref;
  String? userId;
  GenreRepositoryImple(this.ref) {
    storeCollectionReference =
        ref.read(firebaseFireStoreProvider).collection("users");
    userId = ref.read(authControllerProvider)!.uid;
  }
  // @override
  // Future<List<QueryDocumentSnapshot<AddPageState>>> fechGenreList() async {
  //   final stateRef = storeCollectionReference!
  //       .where("uid", isEqualTo: userId)
  //       .withConverter<AddPageState>(
  //         fromFirestore: (snapshot, _) =>
  //             AddPageState.fromJson(snapshot.data()!),
  //         toFirestore: (data, _) => data.toJson(),
  //       );

  //   final snapshot = await stateRef.get();

  //   return snapshot.docs;
  // }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachGenreList() async* {
    final stateRef = storeCollectionReference!
        .where("uid", isEqualTo: userId)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((snap) => snap.docs);
  }
}
