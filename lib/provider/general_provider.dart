import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/enums.dart';
import '../model/add_page_state.dart';
import '../view_model/add_page_controller.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

// final authSwitcherControllerProvider =
//     StateNotifierProvider<PageController, PageState>(
//         (ref) => PageController(ref.read));
final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.account);

final incomeExpendSwicherProvider = StateProvider<bool>((ref) => false);

final addPageControllerProvider =
    StateNotifierProvider<AddPageController, AddPageState?>(
        (ref) => AddPageController(ref.read));
