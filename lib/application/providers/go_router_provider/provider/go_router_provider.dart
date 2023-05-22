import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/presentation/pages/add_project_member_page.dart';
import 'package:account_book_app/presentation/pages/create_friend_page.dart';
import 'package:account_book_app/presentation/pages/create_saving_page.dart';
import 'package:account_book_app/presentation/pages/edit_profile_page.dart';
import 'package:account_book_app/presentation/pages/edit_tag_page.dart';
import 'package:account_book_app/presentation/pages/edit_theme_page.dart';
import 'package:account_book_app/presentation/pages/list_page.dart';
import 'package:account_book_app/presentation/pages/setting_page.dart';
import 'package:account_book_app/presentation/pages/sign_in_page.dart';
import 'package:account_book_app/presentation/widgets/create_friend/user_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../presentation/pages/create_target_page.dart';
import '../../../../presentation/pages/detail_page.dart';
import '../../../../presentation/pages/page_root.dart';
import '../../../../presentation/pages/init_tag_page.dart';
import '../../../../presentation/pages/statistic_page.dart';
import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../routes/global_navigator_keys.dart';
import '../routes/routes.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.list,
    navigatorKey: GlobalNavigatorKeys.rootNavigator,
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
            routes: [
              GoRoute(
                path: Routes.projectDetail,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                builder: (context, state) {
                  final project = state.extra as TargetState;
                  return DetailPage(
                    key: state.pageKey,
                    target: project,
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.createSaving,
                    parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                    builder: (context, state) {
                      final project = state.extra as TargetState;
                      return CreateSavingPage(
                        key: state.pageKey,
                        target: project,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: Routes.editTag,
                        parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                        builder: (context, state) {
                          return const EditTagPage();
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.addProjectMember,
                    parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                    builder: (context, state) {
                      final project = state.extra as TargetState;

                      return AddProjectMemberPage(
                        targetState: project,
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: Routes.createTarget,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                builder: (context, state) => CreateTargetPage(
                  key: state.pageKey,
                ),
              ),
            ],
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
            routes: [
              GoRoute(
                path: Routes.editTheme,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                builder: (context, state) {
                  return const EditThemePage();
                },
              ),
              GoRoute(
                path: Routes.createFriend,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                builder: (context, state) {
                  return const CreateFriendPage();
                },
                routes: [
                  GoRoute(
                    path: Routes.userProfile,
                    parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                    builder: (context, state) {
                      final profile = state.extra as Profile;
                      return UserProfile(
                        friendState: profile,
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: Routes.editProfile,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                builder: (context, state) => const EditProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
