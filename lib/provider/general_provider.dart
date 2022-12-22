import 'package:account_book_app/controller/auth_controller.dart';
import 'package:account_book_app/controller/target_init_controller.dart';
import 'package:account_book_app/model/target_init.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constant/enums.dart';
import '../controller/friends_controller.dart';
import '../controller/target_controller.dart';
import '../controller/users_controller.dart';
import '../model/users_state.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
        (ref) => AuthController(ref));

final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState?>(
        (ref) => UsersController(ref));
final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.account);

final friendsListControllerProvider =
    StateNotifierProvider<FriendsController, List<UsersState>>(
        (ref) => FriendsController(ref));
final targetControllerProvider =
    StateNotifierProvider<TargetController, List<TargetState>>(
        (ref) => TargetController(ref));

final targetInitControllerProvider =
    StateNotifierProvider.autoDispose<TargetInitCntroller, TargetInit>(
        (ref) => TargetInitCntroller(ref));
