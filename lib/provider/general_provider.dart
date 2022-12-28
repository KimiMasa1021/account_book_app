import 'package:account_book_app/controller/auth_controller.dart';
import 'package:account_book_app/controller/target_init_controller.dart';
import 'package:account_book_app/model/target_init.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constant/enums.dart';
import '../controller/all_users_controller.dart';
import '../controller/saving_controller.dart';
import '../controller/tags_controller.dart';
import '../controller/target_controller.dart';
import '../controller/users_controller.dart';
import '../model/saving_state.dart';
import '../model/tags_state.dart';
import '../model/users_state.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
        (ref) => AuthController(ref));

final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState?>(
        (ref) => UsersController(ref));
final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.account);

final allUsersControllerProvider =
    StateNotifierProvider<AllUsersController, List<UsersState>>(
        (ref) => AllUsersController(ref));
final targetControllerProvider =
    StateNotifierProvider<TargetController, List<TargetState>>(
        (ref) => TargetController(ref));

final targetInitControllerProvider =
    StateNotifierProvider.autoDispose<TargetInitCntroller, TargetInit>(
        (ref) => TargetInitCntroller(ref));

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
