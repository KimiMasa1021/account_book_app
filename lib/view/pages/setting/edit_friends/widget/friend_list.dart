import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utility/assets_url.dart';
import '../../../../../view_model/friend_controller.dart';
import '../../../../theme/app_text_theme.dart';

class FriendList extends ConsumerWidget {
  const FriendList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsControllerProvider);
    final font = ref.watch(myTextTheme);
    final size = MediaQuery.of(context).size;

    return friends.isNotEmpty
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
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '右上の ',
                        style: font.fs16.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.person_add,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: ' アイコンをタップすることでフレンドを登録できます！',
                        style: font.fs16.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
