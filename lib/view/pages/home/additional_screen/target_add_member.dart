import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/view/pages/home/additional_screen/target_add_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../component/setting/friend_tile_with_radio.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

class TargetAddMember extends HookConsumerWidget {
  const TargetAddMember({super.key});
  static String name = "target_add_member";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final userState = ref.watch(usersControllerProvider);
    final friends = ref.watch(friendsControllerProvider(userState!.friends));
    final targetInit = ref.watch(targetInitControllerProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "メンバーを選択",
          style: theme.textTheme.fs16,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        leading: InkWell(
          onTap: () {
            context.go("/");
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: HexColor("#FFF8DC"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(TargetAddDetails.name);
            },
            padding: const EdgeInsets.only(right: 10),
            icon: Text(
              "次へ",
              style: theme.textTheme.fs16.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#FFF8DC"),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                  userState!.img,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 0),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                          ),
                          Text("あなた", style: theme.textTheme.fs16)
                        ],
                      ),
                    ),
                    ...List.generate(
                      targetInit.selectedUserList.length,
                      (index) => SizedBox(
                        width: 60,
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    targetInit.selectedUserList[index].img,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(0, 0),
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              targetInit.selectedUserList[index].name,
                              style: theme.textTheme.fs16,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                itemCount: friends.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FriendTileWithRadio(
                    usersState: friends[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
