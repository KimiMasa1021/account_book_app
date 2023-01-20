import 'package:account_book_app/model/user/users_state.dart';
import 'package:account_book_app/repository/friend_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/enums.dart';

final friendsControllerProvider =
    StateNotifierProvider<FriendController, List<UsersState>>(
        (ref) => FriendController(ref));

class FriendController extends StateNotifier<List<UsersState>> {
  final Ref ref;

  FriendController(this.ref) : super([]) {
    ref.read(friendRepositoryProvider).feachFriends().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }

  Future<void> testFriendAdd(String user1Uid, String user2Uid) async {
    final res =
        await ref.read(friendRepositoryProvider).addFriend(user1Uid, user2Uid);
    switch (res) {
      case FrendRequestResult.success:
        showToast("フレンド登録が完了しました。");
        break;
      case FrendRequestResult.error:
        showToast("エラーが発生しました。");
        break;
      case FrendRequestResult.alreadyRegistered:
        showToast("すでにフレンド登録済みです。");
        break;
      case FrendRequestResult.injustice:
        showToast("不正なQRコードです。");
        break;
      case FrendRequestResult.notExist:
        showToast("存在しないユーザーです。");
        break;
      default:
        showToast("エラーが発生しました。");
        break;
    }
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
