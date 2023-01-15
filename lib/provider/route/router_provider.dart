import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/provider/route/transition_route.dart';
import 'package:account_book_app/view/pages/auth/auth.dart';
import 'package:account_book_app/view/pages/home/add_project/target_add_image.dart';
import 'package:account_book_app/view/pages/home/detail/details.dart';
import 'package:account_book_app/view/pages/home/add_project/target_add_details.dart';
import 'package:account_book_app/view/pages/home/add_project/target_add_member.dart';
import 'package:account_book_app/view/pages/home/detail/drawers/edit_project/edit_project.dart';
import 'package:account_book_app/view/pages/home/detail/drawers/invite_member/invite_member.dart';
import 'package:account_book_app/view/pages/home/detail/drawers/member_list/member_list.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_add_description.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_management.dart';
import 'package:account_book_app/view/pages/setting/friends_management/friends_qr_scan.dart';
import 'package:account_book_app/view/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../view/pages/auth/privacy_policy.dart';
import '../../view/pages/home/detail/add_saving/saving_add.dart';
import 'guard.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    refreshListenable: authStateNotifier,
    redirect: (context, state) => noAuthGuard(ref, state),
    initialLocation: Routes.path().root,
    routes: [
      //　ログイン画面
      GoRoute(
        path: Routes.path().auth,
        name: Routes.name().auth,
        builder: (context, state) => const Auth(),
        routes: [
          //　プライバシーポリシー
          GoRoute(
            path: Routes.path().privacyPolicy,
            name: Routes.name().privacyPolicy,
            builder: (context, state) => const PrivacyPolicy(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.path().root,
        name: Routes.name().root,
        builder: (BuildContext context, GoRouterState state) {
          return const RootPage();
        },
        redirect: (context, state) => authGuard(ref, state),
        routes: [
          //　プロジェクトの追加
          // メンバー
          GoRoute(
            path: Routes.path().addProjectMember,
            name: Routes.name().addProjectMember,
            builder: (context, state) {
              return const TargetAddMember();
            },
            routes: [
              //　詳細
              GoRoute(
                path: Routes.path().addProjectDetails,
                name: Routes.name().addProjectDetails,
                builder: (context, state) => const TargetAddDetails(),
                routes: [
                  //　画像
                  GoRoute(
                    path: Routes.path().addProjectImage,
                    name: Routes.name().addProjectImage,
                    builder: (context, state) => const TargetAddImage(),
                  ),
                ],
              ),
            ],
          ),
          //　プロジェクトの詳細
          GoRoute(
            path: Routes.path().projectDetails,
            name: Routes.name().projectDetails,
            pageBuilder: (context, state) {
              String docId = state.params['docId']!;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: HomeDetails(
                  docId: docId,
                ),
              );
            },
          ),
          //　節約記録の追加画面
          GoRoute(
            path: Routes.path().addSaving,
            name: Routes.name().addSaving,
            builder: (context, state) {
              String targetId = state.params['targetId']!;
              return SavingAdd(
                docId: targetId,
              );
            },
          ),
          //　プロジェクトの編集画面
          GoRoute(
            path: Routes.path().editProject,
            name: Routes.name().editProject,
            builder: (context, state) {
              String targetId = state.params['targetId']!;
              return EditProject(
                docId: targetId,
              );
            },
          ),
          //　メンバーリスト
          GoRoute(
            path: Routes.path().memberList,
            name: Routes.name().memberList,
            builder: (context, state) {
              String targetId = state.params['targetId']!;
              return MemberList(
                docId: targetId,
              );
            },
          ),
          //　招待画面
          GoRoute(
            path: Routes.path().inviteMember,
            name: Routes.name().inviteMember,
            builder: (context, state) {
              String targetId = state.params['targetId']!;
              return InviteMember(
                docId: targetId,
              );
            },
          ),
          //フレンド一覧
          GoRoute(
            path: Routes.path().friendManagement,
            name: Routes.name().friendManagement,
            builder: (context, state) {
              return const FriendsManagement();
            },
            routes: [
              //フレンド登録手段の選択　QR or Search
              GoRoute(
                path: Routes.path().addFriendDescription,
                name: Routes.name().addFriendDescription,
                builder: (context, state) {
                  return const FriendsAddDescription();
                },
                routes: [
                  // QR SCAN
                  GoRoute(
                    path: Routes.path().scanQr,
                    name: Routes.name().scanQr,
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
    ],
  ),
);

class _AuthStateNotifier extends ValueNotifier<User?> {
  _AuthStateNotifier() : super(null);
  void change(User? v) => value = v;
}

final authStateNotifier = _AuthStateNotifier();

final authProvider = StreamProvider<User?>(
  (ref) {
    ref.listenSelf((_, v) => authStateNotifier.change(v.value));
    return FirebaseAuth.instance.authStateChanges();
  },
);
