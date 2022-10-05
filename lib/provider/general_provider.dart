import 'package:account_book_app/controller/account_controller.dart';
import 'package:account_book_app/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/enums.dart';
import '../controller/saving_controller.dart';
import '../controller/users_controller.dart';
import '../model/account_state.dart';
import '../model/saving_state.dart';
import '../model/users_state.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.account);

final incomeExpendSwicherProvider = StateProvider<bool>((ref) => true);

final usersControllerProvider =
    StateNotifierProvider<UsersController, UsersState?>(
        (ref) => UsersController(ref.read));
final accountControllerPrvider =
    StateNotifierProvider<AccountController, AsyncValue<List<AccountState>>>(
        (ref) => AccountController(ref.read));

final savingControllerProvider =
    StateNotifierProvider<SavingController, List<SavingState>>(
        (ref) => SavingController(ref.read));
