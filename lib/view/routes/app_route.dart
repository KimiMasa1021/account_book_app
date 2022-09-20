import 'package:account_book_app/view/pages/account/account.dart';
import 'package:account_book_app/view/auth/sign_up.dart';
import 'package:account_book_app/view/routes/route_path.dart';
import 'package:auto_route/auto_route.dart';

import '../auth/sign_in.dart';
import '../auth/top.dart';
import '../pages/account/account_add.dart';
import '../separate.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteSignIn,
      page: Separate,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteTop,
      page: Top,
    ),
    AutoRoute(
      path: RoutePath.appRouteSignUp,
      page: SignUp,
    ),
    AutoRoute(
      path: RoutePath.appRouteSignIn,
      page: SignIn,
    ),
    AutoRoute(
      path: RoutePath.appRouteAccount,
      page: AccountPage,
    ),
    AutoRoute(
      path: RoutePath.appRouteAccount,
      page: AccountAdd,
    ),
  ],
)
class $AppRouter {}
