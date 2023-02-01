import 'package:account_book_app/model/enums.dart';
import 'package:account_book_app/provider/firebase/firebase_auth_provider.dart';
import 'package:account_book_app/provider/route/router_provider.dart';
import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view_model/auth_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/pages/login/login.dart';

typedef RouteGuard = String? Function(Ref ref, GoRouterState state);

String? combineGuard(GoRouterState state, Ref ref, List<RouteGuard> guards) {
  for (final guard in guards) {
    final redirectTo = guard(ref, state);
    if (redirectTo != null) {
      return redirectTo;
    }
  }
  return null;
}

String? authGuard(Ref ref, GoRouterState state) {
  final isNotAuthenticated = ref.read(authProvider).value == null;
  if (isNotAuthenticated) {
    return Routes.path().auth;
  } else {
    return null;
  }
}

String? noAuthGuard(Ref ref, GoRouterState state) {
  final isAuthenticated = ref.read(authProvider).value != null;

  if (isAuthenticated) {
    return Routes.path().root;
  } else {
    return null;
  }
}
