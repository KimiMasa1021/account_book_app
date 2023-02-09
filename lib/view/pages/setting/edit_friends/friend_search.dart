import 'package:account_book_app/model/user/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../../utility/lottie_url.dart';
import '../../../../view_model/search_users_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'widget/search_user_panel.dart';

class FriendSearch extends HookConsumerWidget {
  const FriendSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final controller = useTextEditingController(text: "");
    final searchUserCLT =
        ref.watch(searchUsersControllerProvider(null).notifier);
    final ValueNotifier<UsersState?> user = useState(null);
    final size = MediaQuery.of(context).size;
    final loading = useState(false);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("友達リクエスト"),
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
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "IDで検索!",
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
                          primaryFocus?.unfocus();
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
                SearchUserPanel(
                  user: user,
                  loading: loading,
                )
              ],
            ),
          ),
        ),
        loading.value
            ? Material(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        LottieUrl.catLoading.url,
                        width: 230,
                        height: 230,
                        frameRate: FrameRate(60),
                        repeat: true,
                      ),
                      const Text("リクエスト中.."),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
