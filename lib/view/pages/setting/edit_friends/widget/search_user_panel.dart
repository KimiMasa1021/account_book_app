import 'package:account_book_app/view_model/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../model/user/users_state.dart';
import '../../../../../view_model/friend_controller.dart';
import '../../../../theme/app_text_theme.dart';

class SearchUserPanel extends HookConsumerWidget {
  const SearchUserPanel({
    super.key,
    required this.user,
    required this.loading,
  });
  final ValueNotifier<UsersState?> user;
  final ValueNotifier<bool> loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendCTL = ref.watch(friendsControllerProvider.notifier);
    final font = ref.watch(myTextTheme);
    final userState = ref.watch(usersControllerProvider);

    return user.value != null
        ? userState!.uid != user.value!.uid
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
                            user.value!.img,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        user.value!.name,
                        style: font.fs19.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    userState.friends.contains(user.value!.uid)
                        ? Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "登録済み",
                                style: font.fs16.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : !userState.friendRequest.contains(user.value!.uid)
                            ? InkWell(
                                onTap: () async {
                                  loading.value = true;
                                  await friendCTL
                                      .friendRequest(user.value!.uid);
                                  loading.value = false;
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(200),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "リクエスト送信",
                                      style: font.fs16.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(200),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "送信済み",
                                    style: font.fs16.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
                            user.value!.img,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${user.value!.name} (あなた)",
                        style: font.fs19.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
        : const SizedBox();
  }
}
