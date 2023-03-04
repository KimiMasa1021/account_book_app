import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/enums.dart';
import '../../model/target/target_state.dart';
import '../../model/user/users_state.dart';
import '../../view/pages/add_project/target_add_details.dart';
import '../../view/pages/add_project/target_add_image.dart';
import '../../view/pages/add_project/target_add_member.dart';
import '../../view/pages/detail/add_saving/add_saving.dart';
import '../../view/pages/detail/add_tag/add_tag.dart';
import '../../view/pages/detail/details.dart';
import '../../view/pages/detail/edit_project/edit_project.dart';
import '../../view/pages/detail/invite_member/invite_member.dart';
import '../../view/pages/detail/member_list/member_list.dart';
import '../../view/pages/login/login.dart';
import '../../view/pages/setting/edit_design/edit_design.dart';
import '../../view/pages/setting/edit_friends/friend_status.dart';
import '../../view/pages/setting/edit_friends/scan_qr.dart';
import '../../view/pages/setting/edit_friends/user_profile.dart';
import '../../view/pages/setting/edit_profile/edit_profile.dart';
import '../../view/pages/web_view/web_view_page.dart';
import '../../view/root_page.dart';
import 'guard.dart';
import 'routes.dart';
import 'transition_route.dart';

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
              return horizontalSlideTransition<void>(
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
              return AddSaving(
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
          GoRoute(
            path: Routes.path().addTag,
            name: Routes.name().addTag,
            builder: (context, state) {
              return const AddTag();
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
                path: Routes.path().userProfile,
                name: Routes.name().userProfile,
                builder: (context, state) {
                  final friendState = state.extra as UsersState;
                  return UserProfile(
                    friendState: friendState,
                  );
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
