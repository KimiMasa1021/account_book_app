import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/general_provider.dart';
import 'friend_add_scan.dart';

class FriendsList extends HookConsumerWidget {
  const FriendsList({super.key});
  static String id = "friends_list";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsListState = ref.watch(friendsListControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: friendsListState.isNotEmpty
            ? ListView.builder(
                itemCount: friendsListState.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            image: friendsListState[index].img != ""
                                ? DecorationImage(
                                    image: NetworkImage(
                                        friendsListState[index].img),
                                  )
                                : const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/img/profile.png"),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              friendsListState[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              friendsListState[index].email,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FriendAddScan.id);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 22),
                          children: [
                            TextSpan(
                              text: 'フレンド登録は',
                            ),
                            TextSpan(
                              text: 'こちら',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: 'から',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
