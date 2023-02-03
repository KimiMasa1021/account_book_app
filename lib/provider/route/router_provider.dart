import 'package:account_book_app/model/enums.dart';
import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/provider/route/transition_route.dart';
import 'package:account_book_app/view/pages/login/login.dart';
import 'package:account_book_app/view/pages/add_project/target_add_image.dart';
import 'package:account_book_app/view/pages/detail/details.dart';
import 'package:account_book_app/view/pages/add_project/target_add_details.dart';
import 'package:account_book_app/view/pages/add_project/target_add_member.dart';
import 'package:account_book_app/view/pages/detail/edit_project/edit_project.dart';
import 'package:account_book_app/view/pages/detail/invite_member/invite_member.dart';
import 'package:account_book_app/view/pages/detail/member_list/member_list.dart';
import 'package:account_book_app/view/pages/setting/edit_friends/friend_search.dart';
import 'package:account_book_app/view/pages/setting/edit_profile/edit_profile.dart';
import 'package:account_book_app/view/pages/setting/edit_design/edit_design.dart';
import 'package:account_book_app/view/pages/setting/edit_friends/add_friend_selector.dart';
import 'package:account_book_app/view/pages/setting/edit_friends/friend_status.dart';
import 'package:account_book_app/view/pages/setting/edit_friends/scan_qr.dart';
import 'package:account_book_app/view/pages/web_view/web_view_page.dart';
import 'package:account_book_app/view/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/target/target_state.dart';
import '../../view/pages/detail/add_saving/saving_add.dart';
import 'guard.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    refreshListenable: authStateNotifier,
    initialLocation: Routes.path().root,
    routes: [
      GoRoute(
        path: Routes.path().auth,
        name: Routes.name().auth,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: Routes.path().root,
        name: Routes.name().root,
        builder: (BuildContext context, GoRouterState state) {
          return const RootPage();
        },
        redirect: (context, state) => authGuard(ref, state),
        routes: [
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
              final target = state.extra as TargetState;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: HomeDetails(
                  target: target,
                ),
              );
            },
          ),
          //　節約記録の追加画面
          GoRoute(
            path: Routes.path().addSaving,
            name: Routes.name().addSaving,
            builder: (context, state) {
              final target = state.extra as TargetState;
              return SavingAdd(
                target: target,
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
              final target = state.extra as TargetState;
              return MemberList(
                target: target,
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
              return const FriendStatus();
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
                      return const ScanQr();
                    },
                  ),
                  // フレンド検索
                  GoRoute(
                    path: Routes.path().friendSearch,
                    name: Routes.name().friendSearch,
                    builder: (context, state) {
                      return const FriendSearch();
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Routes.path().designManagement,
            name: Routes.name().designManagement,
            builder: (context, state) {
              return const EditDesign();
            },
          ),
          GoRoute(
            path: Routes.path().accountManagement,
            name: Routes.name().accountManagement,
            builder: (context, state) {
              return const EditProfile();
            },
          ),
          GoRoute(
            path: Routes.path().webView,
            name: Routes.name().webView,
            builder: (context, state) {
              final type = state.extra as WebViewType;
              return WebViewPage(
                type: type,
              );
            },
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
