import 'package:account_book_app/model/user/users_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/friend_repository.dart';

final searchUsersControllerProvider = StateNotifierProvider.family<
        SearchUsersController, AsyncValue<List<UsersState>>, List<String>?>(
    (ref, List<String>? members) => SearchUsersController(ref, members));

class SearchUsersController
    extends StateNotifier<AsyncValue<List<UsersState>>> {
  final Ref ref;
  List<String>? members;

  SearchUsersController(this.ref, this.members)
      : super(const AsyncValue.loading()) {
    if (members != null) {
      ref.read(friendRepositoryProvider).feachTargetMembers(members!).listen(
        (data) {
          state = AsyncValue.data(
            data.map((doc) => doc.data()).toList(),
          );
        },
      );
    }
  }

  Future<UsersState?> searchUser(String uid) async {
    final user = await ref.read(friendRepositoryProvider).feachSearchUser(uid);
    return user;
  }
}
