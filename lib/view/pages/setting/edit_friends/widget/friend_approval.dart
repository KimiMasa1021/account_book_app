import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../view_model/friend_controller.dart';
import '../../../../../view_model/search_users_controller.dart';
import '../../../../../view_model/users_controller.dart';
import '../../../../theme/app_text_theme.dart';

class FriendApproval extends HookConsumerWidget {
  const FriendApproval({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final userState = ref.watch(usersControllerProvider);
    final targetMembers = ref.watch(
      searchUsersControllerProvider(userState!.friendsApproval.isNotEmpty
          ? userState.friendsApproval
          : ["abc"]),
    );
    final friendCTL = ref.watch(friendsControllerProvider.notifier);

    final loading = useState(false);

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
                        color: Theme.of(context).colorScheme.surface,
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
                    !loading.value
                        ? Container(
                            height: 45,
                            width: 45,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    InkWell(
                      onTap: () async {
                        if (loading.value) return;
                        loading.value = true;
                        await friendCTL.friendApproval(
                          val[index].uid,
                          val[index].name,
                        );
                        loading.value = false;
                      },
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            !loading.value ? "承認" : "承認中",
                            style: font.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
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
        return const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}
