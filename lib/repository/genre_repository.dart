import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/genre_state.dart';

import '../provider/firebase_firestore_provider.dart';

final genreRepositoryProvider =
    Provider<GenreRepository>((ref) => GenreRepositoryImple(ref.read));

abstract class GenreRepository {
  // Future<List<QueryDocumentSnapshot<AddPageState>>> fechGenreList();
  //ジャンル一覧の取得
  Stream<List<QueryDocumentSnapshot<GenreState>>> feachGenreList();
}

class GenreRepositoryImple implements GenreRepository {
  CollectionReference? storeCollectionReference;
  final Reader _reader;
  String? userId;
  GenreRepositoryImple(this._reader) {
    storeCollectionReference =
        _reader(firebaseFireStoreProvider).collection("users");
    userId = _reader(authControllerProvider)!.uid;
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
  Stream<List<QueryDocumentSnapshot<GenreState>>> feachGenreList() async* {
    final stateRef = storeCollectionReference!
        .where("uid", isEqualTo: userId)
        .withConverter<GenreState>(
          fromFirestore: (snapshot, _) => GenreState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((snap) => snap.docs);
  }
}
