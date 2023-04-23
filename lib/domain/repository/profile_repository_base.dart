import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entity/profile/profile.dart';

abstract class ProfileRepositoryBase {
  void subscribeStream(void Function(Profile) onCompleted);
  Future<Result<bool>> saveUsesrData(UserCredential credential);
  Future<Result<bool>> initializeTag(List<String> tags);
}
