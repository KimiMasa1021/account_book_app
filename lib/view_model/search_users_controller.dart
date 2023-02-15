import 'package:account_book_app/model/user/users_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    if (user == null) {
      showToast("見つかりませんでした");
    }
    return user;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }
}
