import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../application/providers/profile_notifier_provider/state/profile.dart';

abstract class ProfileRepositoryBase {
  void subscribeStream(void Function(Profile) onCompleted);
  void subscribeSearchUserStream(
    void Function(List<Profile>) onCompleted,
    List<String> userList,
  );
  Future<Result<bool>> saveUsesrData(UserCredential credential);
  Future<Result<bool>> initializeTag(List<String> tags);
  Future<Result> updateTag(List<String> tags);
  Future<Result<Profile?>> searchUser(String uid);
  Future<Result> signOut();
  Future<Result<bool>> editProfile(String name, String imageUrl);
}
