import 'package:account_book_app/view/pages/setting/edit_friends/widget/friend_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/route/routes.dart';
import 'widget/friend_approval.dart';

class FriendStatus extends ConsumerWidget {
  const FriendStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("フレンド管理"),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.name().addFriendDescription);
              },
              icon: const Icon(Icons.person_add),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.onBackground,
            labelColor: Theme.of(context).colorScheme.onBackground,
            unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
            tabs: const [
              Tab(text: "フレンドリスト"),
              Tab(text: "承認リクエスト"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FriendList(),
            FriendApproval(),
          ],
        ),
      ),
    );
  }
}
