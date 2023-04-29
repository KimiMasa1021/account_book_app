import 'dart:async';
import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/domain/repository/saving_repository_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final savingRepositoryProvider =
    Provider<SavingRepository>((ref) => SavingRepository(ref));

class SavingRepository implements SavingRepositoryBase {
  SavingRepository(this.ref) : super();

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final Ref ref;

  //  特定のプロジェクトのSavingList
  late Stream<QuerySnapshot<SavingState>>? _savingStream;
  late StreamSubscription? _streamListener;

  @override
  void subscribeStream(
    void Function(List<SavingState> p1) onCompleted,
    String productId,
  ) {
    try {
      _savingStream = _db
          .collection('targets')
          .doc(productId)
          .collection("saving")
          .withConverter<SavingState>(
            fromFirestore: (snapshot, _) =>
                SavingState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          )
          .snapshots();
      _streamListener = _savingStream?.listen((event) {
        if (event.docs.isNotEmpty) {
          final savingList = event.docs.map((e) => e.data()).toList();
          onCompleted(savingList);
        } else {
          onCompleted([]);
        }
      });
    } on Exception catch (e) {
      return;
    }
  }

  // //  特定のプロジェクトのSavingList
  late Stream<QuerySnapshot<SavingState>>? _userSavingStream;
  late StreamSubscription? _userSavingstreamListener;

  @override
  void subscribeUserStream(
    void Function(List<SavingState> p1) onCompleted,
  ) {
    try {
      final uid = _auth.currentUser!.uid;

      _userSavingStream = _db
          .collectionGroup("saving")
          .where("userId", isEqualTo: uid)
          .orderBy(
            "createdAt",
            descending: true,
          )
          .withConverter<SavingState>(
            fromFirestore: (snapshot, _) =>
                SavingState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          )
          .snapshots();
      _streamListener = _userSavingStream?.listen((event) {
        if (event.docs.isNotEmpty) {
          final savingList = event.docs.map((e) => e.data()).toList();
          onCompleted(savingList);
        } else {
          onCompleted([]);
        }
      });
    } on Exception catch (e) {
      return;
    }
  }
}
