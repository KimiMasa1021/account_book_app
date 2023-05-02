import 'dart:async';
import 'dart:io';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/t\arget_provider/state/target_state.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/repository/storage_repository_base.dart';

final storegeRepositoryProvider =
    Provider<StoregeRepositoryBase>((ref) => StoregeRepository(ref));

class StoregeRepository implements StoregeRepositoryBase {
  StoregeRepository(this.ref);

  final _db = FirebaseFirestore.instance;
  final _storege = FirebaseStorage.instance;

  final Ref ref;

  @override
  Future<Result<String>> uploadImage(File file) async {
    try {
      final date = DateTime.now().toString();
      final uid = ref.read(profileNotifierProvider).uid;

      String uploadName = "$date$uid.png";
      final storageRef = _storege.ref().child(
            'Image/$uploadName',
          );
      await storageRef.putFile(file);
      final url = await storageRef.getDownloadURL();
      if (url.isEmpty) return Result.error("");
      return Result.value(url);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
