import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:account_book_app/view_model/friend_controller.dart';
import 'package:account_book_app/view_model/target_init_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/enums.dart';
import '../model/saving/saving_state.dart';
import '../model/target/target_init.dart';
import '../model/target/target_state.dart';
import '../model/user/users_state.dart';
import '../view/theme/my_theme_mode.dart';
import '../view_model/all_users_controller.dart';
import '../view_model/saving_controller.dart';
import '../view_model/tags_controller.dart';
import '../view_model/target_controller.dart';
import '../view_model/theme_controller.dart';
import '../view_model/users_controller.dart';
import '../model/saving/tags_state.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
        (ref) => AuthController(ref));

final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState?>(
        (ref) => UsersController(ref));
final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.home);

final allUsersControllerProvider =
    StateNotifierProvider<AllUsersController, List<UsersState>>(
        (ref) => AllUsersController(ref));
final targetControllerProvider =
    StateNotifierProvider<TargetController, AsyncValue<List<TargetState>>>(
        (ref) => TargetController(ref));

final targetInitControllerProvider = StateNotifierProvider.autoDispose
    .family<TargetInitCntroller, TargetInit, TargetState?>(
        (ref, target) => TargetInitCntroller(ref, target: target));

final savingControllerProvider =
    StateNotifierProvider<SavingController, List<SavingState>>(
        (ref) => SavingController(ref));

final friendsControllerProvider = Provider.family(
  (ref, List<String> friends) {
    final users = ref.read(allUsersControllerProvider);
    return users.where((e) => friends.contains(e.uid)).toList();
  },
);
final tagsControllerProvider =
    StateNotifierProvider<TagsController, List<Tags>>(
        (ref) => TagsController(ref));
final friendControllerProvider =
    StateNotifierProvider<FriendController, String>(
        (ref) => FriendController(ref));

final themeControllerProvider =
    StateNotifierProvider.autoDispose<ThemeController, ExThemeMode>(
  (ref) => throw UnimplementedError(),
);
final themeControllerProviderFamily =
    StateNotifierProvider.family.autoDispose<ThemeController, ExThemeMode, int>(
  (ref, int id) => ThemeController(ref, id),
);
