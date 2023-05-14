import 'package:async/async.dart';

abstract class ApiRepositoryBase {
  Future<Result<String?>> sendFriendRequest(String friendUid);
}
