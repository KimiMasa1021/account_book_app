import 'package:account_book_app/view/pages/setting/edit_friends/widget/friend_empty.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/route/routes.dart';
import '../../../../view_model/friend_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'widget/friend_approval.dart';

class FriendStatus extends ConsumerWidget {
  const FriendStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsControllerProvider);
    final font = ref.watch(myTextTheme);
    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンド管理"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.name().scanQr);
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: friends.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                friends[index].img,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              friends[index].name,
                              style: font.fs19.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              friends[index].email,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          : const FriendsEmpty(),
    );
  }
}
