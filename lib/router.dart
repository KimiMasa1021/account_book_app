import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/view/auth/top.dart';
import 'package:account_book_app/view/pages/home/detail/details.dart';
import 'package:account_book_app/view/pages/home/additional_screen/target_add_details.dart';
import 'package:account_book_app/view/pages/home/additional_screen/target_add_member.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_add_description.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_management.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_qr_scan.dart';
import 'package:account_book_app/view/root_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'view/auth/privacy_policy.dart';
import 'view/pages/home/detail/saving_add.dart';
import 'view/separate.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      //Auth 認証画面
      GoRoute(
        path: '/',
        builder: (context, state) => const Separate(),
      ),
      GoRoute(
        path: '/auth',
        name: Top.name,
        builder: (context, state) => Top(
          flg: ValueNotifier(false),
        ),
      ),
      GoRoute(
        path: '/root_page',
        name: RootPage.name,
        builder: (context, state) => const RootPage(),
      ),
      GoRoute(
        path: '/privacy_policy',
        name: PrivacyPolicy.name,
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
        path: '/home/detail/:docId',
        name: HomeDetails.name,
        builder: (context, state) {
          String docId = state.params['docId']!;

          return HomeDetails(
            docId: docId,
          );
        },
      ),
      GoRoute(
        path: '/saving_add/:docId',
        name: SavingAdd.name,
        builder: (context, state) {
          String docId = state.params['docId']!;
          debugPrint(docId);
          return SavingAdd(
            docId: docId,
          );
        },
      ),
      //設定タグ
      GoRoute(
        path: '/setting/friends_management',
        name: FriendsManagement.name,
        builder: (context, state) {
          return const FriendsManagement();
        },
        routes: [
          GoRoute(
            path: 'friends_add_description',
            name: FriendsAddDescription.name,
            builder: (context, state) {
              return const FriendsAddDescription();
            },
            routes: [
              GoRoute(
                path: 'friends_add_description',
                name: FriendsQrScan.name,
                builder: (context, state) {
                  return FriendsQrScan();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
