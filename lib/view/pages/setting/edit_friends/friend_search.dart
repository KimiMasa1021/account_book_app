import 'package:account_book_app/model/user/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/search_users_controller.dart';
import '../../../theme/app_text_theme.dart';

class FriendSearch extends HookConsumerWidget {
  const FriendSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final controller = useTextEditingController(text: "");
    final searchUserCLT =
        ref.watch(searchUsersControllerProvider(null).notifier);

    final ValueNotifier<UsersState?> user = useState(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンド検索"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.person_search_outlined,
                      size: 33,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "IDで検索！",
                        hintStyle: font.fs19,
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      user.value =
                          await searchUserCLT.searchUser(controller.text);
                    },
                    icon: Text(
                      "検索",
                      style: font.fs16,
                    ),
                  )
                ],
              ),
            ),
            user.value != null
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
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSecondary,
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
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
