import 'package:account_book_app/provider/general_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_firestore_provider.dart';

final addPageRepositoryProvider =
    Provider<AddPageRepository>((ref) => AddPageRepositoryImple(ref.read));

abstract class AddPageRepository {
  Stream<QuerySnapshot> get fetchGenreList;
}

class AddPageRepositoryImple implements AddPageRepository {
  CollectionReference? storeCollectionReference;
  final Reader _reader;
  String? userId;
  AddPageRepositoryImple(this._reader) {
    storeCollectionReference =
        _reader(firebaseFireStoreProvider).collection("users");
    userId = _reader(authControllerProvider)!.uid;
  }
  @override
  Stream<QuerySnapshot> get fetchGenreList {
    return storeCollectionReference!
        .where("uid", isEqualTo: userId)
        .snapshots();
  }

  // <List<Map<String, String>>>
}
