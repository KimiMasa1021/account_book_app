import 'package:account_book_app/view/auth/test2.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/auth/test.dart';
import 'view/separate.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Separate(),
      ),
      GoRoute(
        path: '/tab',
        builder: (context, state) => const Test(),
      ),
      GoRoute(
        path: '/tab2/:text',
        builder: (context, state) {
          final text = state.params['text'];
          return Test2(
            testText: text!,
          );
        },
      ),
      // GoRoute(
      //   path: '/tab/:index/next/:number', // :hoge とすることでパラメタとして値を与えられる
      //   builder: (context, state) {
      //     final number = state.params['number'];
      //     return TabNextScreen(number: number!);
      //   },
      // ),
    ],
  ),
);
