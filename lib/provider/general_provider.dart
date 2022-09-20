import 'package:account_book_app/model/page_state.dart';
import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:account_book_app/view_model/page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/enums.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

final authControllerprovider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

final pageControllerProvider = StateNotifierProvider<PageController, PageState>(
    (ref) => PageController(ref.read));

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.account);
