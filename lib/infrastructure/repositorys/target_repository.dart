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

  @override
  Future<Result<bool>> addTarget(TargetState state) async {
    try {
      await _db.collection("targets").add(state.toJson());
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.value(true);
  }
}
