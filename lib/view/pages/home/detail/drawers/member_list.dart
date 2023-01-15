import 'package:account_book_app/provider/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../provider/general_provider.dart';
import '../../../../component/setting/friend_tile.dart';

class MemberList extends HookConsumerWidget {
  const MemberList({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final target = ref.watch(targetControllerProvider);
    final allUser = ref.watch(allUsersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("メンバーリスト"),
      ),
      body: target.when(
        data: (data) {
          final target = data.singleWhere((e) => e.docId == docId);
          final members = allUser
              .where(
                (e) => target.members.contains(e.uid),
              )
              .toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                itemCount: members.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FriendTile(
                    usersState: members[index],
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
