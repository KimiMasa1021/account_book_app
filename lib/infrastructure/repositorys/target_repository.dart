import 'dart:async';
import 'package:account_book_app/application/providers/t\arget_provider/state/target_state.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/repository/target_repository_base.dart';

final targetRepositoryProvider =
    Provider<TargetRepositoryBase>((ref) => TargetRepository(ref));

class TargetRepository implements TargetRepositoryBase {
  TargetRepository(this.ref);

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final Ref ref;
  late Stream<QuerySnapshot<TargetState>>? _stream;
  late StreamSubscription? _streamListener;

  @override
  void subscribeStream(
    void Function(List<TargetState> p1) onCompleted,
  ) {
    final uid = _auth.currentUser!.uid;

    try {
      _stream = _db
          .collection('targets')
          .where("members", arrayContains: uid)
          .orderBy("registeTime")
          .withConverter<TargetState>(
            fromFirestore: (snapshot, _) =>
                TargetState.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          )
          .snapshots();

      _streamListener = _stream?.listen((event) {
        if (event.docs.isNotEmpty) {
          final savingList = event.docs.map((e) {
            final state = e.data();
            return TargetState(
              target: state.target,
              targetPrice: state.targetPrice,
              imageUrl: state.imageUrl,
              members: state.members,
              currentPercent: state.currentPercent,
              registeTime: state.registeTime,
              targetDate: state.targetDate,
              productId: e.id,
            );
          }).toList();
          onCompleted(savingList);
        } else {
          onCompleted([]);
        }
      });
    } on Exception catch (e) {
      return;
    }
  }

  @override
  Future<Result<bool>> addTarget(TargetState state) async {
    try {
      await _db.collection("targets").add(state.toJson());
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value(true);
  }

  @override
  Future<Result> editCurrentPercent(
    String productId,
    double newPercent,
  ) async {
    try {
      await _db.collection("targets").doc(productId).set(
        {
          "currentPercent": newPercent,
        },
        SetOptions(merge: true),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value("");
  }
}
