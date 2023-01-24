import 'package:account_book_app/model/user/users_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/friend_repository.dart';

final targetMembersControllerProvider = StateNotifierProvider.autoDispose
    .family<TargetMembersController, AsyncValue<List<UsersState>>,
            List<String>>(
        (ref, List<String> members) => TargetMembersController(ref, members));

class TargetMembersController
    extends StateNotifier<AsyncValue<List<UsersState>>> {
  final Ref ref;
  final List<String> members;

  TargetMembersController(this.ref, this.members)
      : super(const AsyncValue.loading()) {
    ref.read(friendRepositoryProvider).feachTargetMembers(members).listen(
      (data) {
        state = AsyncValue.data(
          data.map((doc) => doc.data()).toList(),
        );
      },
    );
  }
}
