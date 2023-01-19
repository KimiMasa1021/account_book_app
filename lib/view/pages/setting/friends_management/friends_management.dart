import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/general_provider.dart';
import '../../../../provider/route/routes.dart';
import '../../../theme/v1/app_theme.dart';

class FriendsManagement extends HookConsumerWidget {
  const FriendsManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final friends = ref.watch(friendsControllerProvider(userState!.friends));
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                          style: theme.textTheme.fs19.copyWith(
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
        ),
      ),
    );
  }
}
