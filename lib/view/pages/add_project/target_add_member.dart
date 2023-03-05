import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utility/assets_url.dart';
import '../../../view_model/friend_controller.dart';
import '../../../view_model/target_init_controller.dart';
import '../../../view_model/users_controller.dart';
import '../../theme/app_text_theme.dart';
import 'widgets/friend_tile_with_radio.dart';
import '../../../provider/route/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TargetAddMember extends ConsumerWidget {
  const TargetAddMember({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final friends = ref.watch(friendsControllerProvider);
    final targetInit = ref.watch(targetInitControllerProvider(null));
    final font = ref.watch(myTextTheme);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("メンバーを選択"),
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.name().addProjectDetails);
            },
            padding: const EdgeInsets.only(right: 10),
            icon: const Text("次へ"),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
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
                              image: userState?.img != ""
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        userState!.img,
                                      ),
                                    )
                                  : null,
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
                            "あなた",
                            style: font.fs16.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                        ],
                      ),
                    ),
                    ...List.generate(
                      targetInit.selectedUserList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
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
                                  image:
                                      targetInit.selectedUserList[index].img !=
                                              ""
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                targetInit
                                                    .selectedUserList[index]
                                                    .img,
                                              ),
                                            )
                                          : null,
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
                                style: font.fs16.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          friends.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: ListView.builder(
                        itemCount: friends.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FriendTileWithRadio(
                            usersState: friends[index],
                          );
                        },
                      )),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          SvgUrl.team.url,
                          height: size.width / 3,
                          width: size.width / 3,
                        ),
                        Text(
                          "現在フレンドが登録されてません",
                          style: font.fs19.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "フレンドを登録することでメンバーとして招待することができます！！",
                          style: font.fs19.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.pushNamed(Routes.name().userProfile);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Center(
                              child: Text(
                                "フレンド登録はこちら！",
                                style: font.fs16.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
