import 'package:account_book_app/repository/all_users_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/user/users_state.dart';

class AllUsersController extends StateNotifier<List<UsersState>> {
  final Ref ref;
  AllUsersController(this.ref) : super([]) {
    ref.read(allUsersRepositoryProvider).feachFriends().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }
}
