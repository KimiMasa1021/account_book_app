import 'package:account_book_app/infrastructure/repositorys/api_repository.dart';
import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiServiceProvider = Provider(
  (ref) => ApiService(
    apiRepositroy: ref.read(apiRepositoryProvider),
  ),
);

class ApiService {
  ApiService({required apiRepositroy})
      : _apiRepositroy = apiRepositroy,
        super();

  final ApiRepositroy _apiRepositroy;

  Future<Result<String?>> sendFriendRequest(String friendUid) async {
    final result = await _apiRepositroy.sendFriendRequest(friendUid);
    return result;
  }
}
