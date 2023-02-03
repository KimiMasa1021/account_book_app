import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../view_model/friend_controller.dart';
import '../../../../../view_model/target_members_controller.dart';
import '../../../../../view_model/users_controller.dart';
import '../../../../theme/app_text_theme.dart';

class FriendApproval extends ConsumerWidget {
  const FriendApproval({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final userState = ref.watch(usersControllerProvider);
    final targetMembers = ref.watch(
      targetMembersControllerProvider(userState!.friendsApproval.isNotEmpty
          ? userState.friendsApproval
          : ["abc"]),
    );
    return targetMembers.when(
      data: (val) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: val.length,
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
                            val[index].img,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        val[index].name,
                        style: font.fs19.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "承認",
                          style: font.fs19.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (e, s) {
        return SizedBox();
      },
      loading: () {
        return SizedBox();
      },
    );
  }
}
