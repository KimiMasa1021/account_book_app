import 'package:account_book_app/model/users_state.dart';
import 'package:account_book_app/repository/friends_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendsController extends StateNotifier<List<UsersState>> {
  final Ref ref;
  FriendsController(this.ref) : super([]) {
    ref.read(friendsListRepositoryProvider).feachFriends().listen((data) {
      state = data.map((doc) => doc.data()).toList();
      debugPrint(state.toString());
    });
  }
}
