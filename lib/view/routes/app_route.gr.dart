// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:account_book_app/view/pages/account/account.dart' as _i5;
import 'package:account_book_app/view/auth/sign_in.dart' as _i4;
import 'package:account_book_app/view/auth/sign_up.dart' as _i3;
import 'package:account_book_app/view/auth/top.dart' as _i2;
import 'package:account_book_app/view/separate.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Separate.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Separate(),
      );
    },
    Top.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Top(),
      );
    },
    SignUp.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
    SignIn.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignIn(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.AccountPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/sign_in',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          Separate.name,
          path: '/sign_in',
        ),
        _i6.RouteConfig(
          Top.name,
          path: '/top',
        ),
        _i6.RouteConfig(
          SignUp.name,
          path: '/sign_up',
        ),
        _i6.RouteConfig(
          SignIn.name,
          path: '/sign_in',
        ),
        _i6.RouteConfig(
          AccountRoute.name,
          path: '/account',
        ),
      ];
}

/// generated route for
/// [_i1.Separate]
class Separate extends _i6.PageRouteInfo<void> {
  const Separate()
      : super(
          Separate.name,
          path: '/sign_in',
        );

  static const String name = 'Separate';
}

/// generated route for
/// [_i2.Top]
class Top extends _i6.PageRouteInfo<void> {
  const Top()
      : super(
          Top.name,
          path: '/top',
        );

  static const String name = 'Top';
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i6.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/sign_up',
        );

  static const String name = 'SignUp';
}

/// generated route for
/// [_i4.SignIn]
class SignIn extends _i6.PageRouteInfo<void> {
  const SignIn()
      : super(
          SignIn.name,
          path: '/sign_in',
        );

  static const String name = 'SignIn';
}

/// generated route for
/// [_i5.AccountPage]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: '/account',
        );

  static const String name = 'AccountRoute';
}
