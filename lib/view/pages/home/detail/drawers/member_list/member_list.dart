import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../model/target/target_state.dart';
import '../../../../../../view_model/friend_controller.dart';
import '../../../../../../view_model/target_controller.dart';
import '../../../../../../view_model/target_members_controller.dart';
import '../../../../../component/setting/friend_tile.dart';

class MemberList extends HookConsumerWidget {
  const MemberList({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendCTL = ref.watch(friendsControllerProvider.notifier);
    final targetMembers =
        ref.watch(targetMembersControllerProvider(target.members));
    return Scaffold(
      appBar: AppBar(
        title: const Text("メンバーリスト"),
      ),
      body: targetMembers.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FriendTile(
                    usersState: data[index],
                  );
                },
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
      ),
    );
  }
}
