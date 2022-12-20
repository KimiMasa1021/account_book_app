import 'package:account_book_app/view/pages/home/home_details.dart';
import 'package:account_book_app/view/pages/home/target_add_details.dart';
import 'package:account_book_app/view/pages/home/target_add_member.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'view/auth/privacy_policy.dart';
import 'view/separate.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Separate(),
      ),
      GoRoute(
        path: '/privacy_policy',
        builder: (context, state) => const PrivacyPolicy(),
      ),
      GoRoute(
        path: '/home/target_add_member',
        name: TargetAddMember.name,
        builder: (context, state) {
          return const TargetAddMember();
        },
      ),
      GoRoute(
        path: '/home/target_add_details',
        name: TargetAddDetails.name,
        builder: (context, state) {
          return const TargetAddDetails();
        },
      ),
      GoRoute(
        path: '/home/detail',
        name: HomeDetails.name,
        builder: (context, state) {
          return const HomeDetails();
        },
      )
    ],
  ),
);
