import 'package:account_book_app/application/providers/go_router_provider/routes/routes.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/search_user_provider/provider/search_user_provider.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/add_project_member_provider/provider/add_project_member_provider.dart';
import '../../application/providers/profile_notifier_provider/state/profile.dart';
import '../../common/theme/app_text_theme.dart';
import '../widgets/add_project_member/add_project_member_panel.dart';

class AddProjectMemberPage extends ConsumerWidget {
  const AddProjectMemberPage({
    super.key,
    required this.targetState,
  });
  final TargetState targetState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);
    final searchUser = ref.watch(searchUserNotifierProvider(profile.friends));
    final font = ref.watch(myTextTheme);
    final addProjectMember = ref.watch(addProjectMemberProvider);
    final addProjectMemberCTL = ref.watch(addProjectMemberProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("メンバーを追加"),
        actions: [
          IconButton(
            onPressed: () async => await addProjectMemberCTL.addMember(
              targetState,
              () {
                context.go(Routes.list);
              },
            ),
            icon: Text(
              "招待する",
              style: font.fs16.copyWith(
                color: addProjectMember.isNotEmpty
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: searchUser.when(
          data: (List<Profile> data) {
            final user = data
                .where((e) => !targetState.members.contains(e.uid))
                .toList();
            return Column(
              children: [
                ...List.generate(
                  user.length,
                  (index) => AddProjectMemberPanel(profile: user[index]),
                )
              ],
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return const SizedBox();
          },
          loading: () {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
