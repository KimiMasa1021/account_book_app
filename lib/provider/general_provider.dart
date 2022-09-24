import 'package:account_book_app/view_model/account_controller.dart';
import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/enums.dart';
import '../model/genre_state.dart';
import '../view_model/genre_controller.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

// final authSwitcherControllerProvider =
//     StateNotifierProvider<PageController, PageState>(
//         (ref) => PageController(ref.read));
final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.account);

final incomeExpendSwicherProvider = StateProvider<bool>((ref) => false);

final genreControllerProvider =
    StateNotifierProvider<GenreController, GenreState?>(
        (ref) => GenreController(ref.read));
final accountControllerPrvider =
    StateNotifierProvider((ref) => AccountController(ref.read));
