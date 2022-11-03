import 'package:account_book_app/component/setting/edit_img_dialog.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/view/pages/setting/friend_add_scan.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/setting/setting_tile.dart';
import 'friend_add_qr.dart';
import 'friends_list.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    return SafeArea(
        child: Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 120, 171, 201),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  const BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromARGB(255, 211, 211, 211),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: userState?.img != ""
                              ? DecorationImage(
                                  image: NetworkImage(userState!.img),
                                )
                              : const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/img/profile.png"),
                                ),
                        ),
                      ),
                      Positioned(
                        top: -3,
                        right: -3,
                        child: InkWell(
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return const EditImageDialog();
                              },
                            );
                          },
                          child: Center(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.edit,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userState!.name,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.edit),
                      )
                    ],
                  ),
                  Text(
                    userState.email,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 98, 98, 98),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 3,
                    color: Colors.black,
                  ),
                  SettingTile(
                    icon: Icons.format_list_bulleted,
                    title: "フレンドリスト",
                    function: () {
                      Navigator.pushNamed(context, FriendsList.id);
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_add_alt,
                          size: 30,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "フレンド追加",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, FriendAddQr.id);
                          },
                          child: const Icon(
                            Icons.qr_code,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, FriendAddScan.id);
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
