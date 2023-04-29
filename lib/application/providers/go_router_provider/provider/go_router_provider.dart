import 'package:account_book_app/presentation/pages/list_page.dart';
import 'package:account_book_app/presentation/pages/setting_page.dart';
import 'package:account_book_app/presentation/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../presentation/pages/create_target_page.dart';
import '../../../../presentation/pages/page_root.dart';
import '../../../../presentation/pages/init_tag_page.dart';
import '../../../../presentation/pages/statistic_page.dart';
import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../routes/global_navigator_keys.dart';
import '../routes/routes.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.list,
    redirect: (context, state) {
      final uid = ref.watch(profileNotifierProvider.notifier).abc;
      if (uid == null) {
        return Routes.signIn;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.signIn,
        name: Routes.signIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: Routes.initTags,
        builder: (context, state) => const InitTagPage(),
      ),
      ShellRoute(
        navigatorKey: GlobalNavigatorKeys.shellNavigator,
        builder: (context, state, child) => PageRoot(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: Routes.list,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ListPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.statistic,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: StatisticPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.setting,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: Routes.createTarget,
        builder: (context, state) => const CreateTargetPage(),
      ),
      // GoRoute(
      //   path: Routes.root,
      //   name: Routes.root,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const RootPage();
      //   },
      //   redirect: (context, state) => authGuard(ref, state),
      //   routes: [
      //     GoRoute(
      //       path: Routes.addProjectMember,
      //       name: Routes.addProjectMember,
      //       builder: (context, state) {
      //         return const TargetAddMember();
      //       },
      //       routes: [
      //         //　詳細
      //         GoRoute(
      //           path: Routes.addProjectDetails,
      //           name: Routes.addProjectDetails,
      //           builder: (context, state) => const TargetAddDetails(),
      //           routes: [
      //             //　画像
      //             GoRoute(
      //               path: Routes.addProjectImage,
      //               name: Routes.addProjectImage,
      //               builder: (context, state) => const TargetAddImage(),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     //　プロジェクトの詳細
      //     GoRoute(
      //       path: Routes.projectDetails,
      //       name: Routes.projectDetails,
      //       pageBuilder: (context, state) {
      //         final target = state.extra as TargetState;
      //         return horizontalSlideTransition<void>(
      //           context: context,
      //           state: state,
      //           child: HomeDetails(
      //             target: target,
      //           ),
      //         );
      //       },
      //       routes: [
      //         //　節約記録の追加画面
      //         GoRoute(
      //           path: Routes.addSaving,
      //           name: Routes.addSaving,
      //           builder: (context, state) {
      //             final target = state.extra as TargetState;
      //             return AddSaving(
      //               target: target,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     //　プロジェクトの編集画面
      //     GoRoute(
      //       path: Routes.editProject,
      //       name: Routes.editProject,
      //       builder: (context, state) {
      //         String targetId = state.params['targetId']!;
      //         return EditProject(
      //           docId: targetId,
      //         );
      //       },
      //     ),
      //     //　メンバーリスト
      //     GoRoute(
      //       path: Routes.memberList,
      //       name: Routes.memberList,
      //       builder: (context, state) {
      //         final target = state.extra as TargetState;
      //         return MemberList(
      //           target: target,
      //         );
      //       },
      //     ),
      //     //　招待画面
      //     GoRoute(
      //       path: Routes.inviteMember,
      //       name: Routes.inviteMember,
      //       builder: (context, state) {
      //         String targetId = state.params['targetId']!;
      //         return InviteMember(
      //           docId: targetId,
      //         );
      //       },
      //     ),
      //     GoRoute(
      //       path: Routes.addTag,
      //       name: Routes.addTag,
      //       builder: (context, state) {
      //         return const AddTag();
      //       },
      //     ),
      //     //フレンド一覧
      //     GoRoute(
      //       path: Routes.friendManagement,
      //       name: Routes.friendManagement,
      //       builder: (context, state) {
      //         return const FriendStatus();
      //       },
      //       routes: [
      //         //フレンド登録手段の選択　QR or Search
      //         GoRoute(
      //           path: Routes.userProfile,
      //           name: Routes.userProfile,
      //           builder: (context, state) {
      //             final friendState = state.extra as UsersState;
      //             return UserProfile(
      //               friendState: friendState,
      //             );
      //           },
      //           routes: [
      //             // QR SCAN
      //             GoRoute(
      //               path: Routes.scanQr,
      //               name: Routes.scanQr,
      //               builder: (context, state) {
      //                 return const ScanQr();
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: Routes.designManagement,
      //       name: Routes.designManagement,
      //       builder: (context, state) {
      //         return const EditDesign();
      //       },
      //     ),
      //     GoRoute(
      //       path: Routes.accountManagement,
      //       name: Routes.accountManagement,
      //       builder: (context, state) {
      //         return const EditProfile();
      //       },
      //     ),
      //   ],
      // ),
    ],
  ),
);

// class _AuthStateNotifier extends ValueNotifier<User?> {
//   _AuthStateNotifier() : super(null);
//   void change(User? v) => value = v;
// }

// final authStateNotifier = _AuthStateNotifier();

// final authProvider = StreamProvider<User?>(
//   (ref) {
//     ref.listenSelf((_, v) => authStateNotifier.change(v.value));
//     return FirebaseAuth.instance.authStateChanges();
//   },
// );
