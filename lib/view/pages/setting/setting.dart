import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/setting/setting_tile.dart';

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
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 131, 193, 255),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
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
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromARGB(255, 211, 211, 211),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -60,
                    left: MediaQuery.of(context).size.width / 2 - 75,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          userState!.name,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          userState.email,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 98, 98, 98),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          height: 3,
                          color: Colors.grey,
                        ),
                        SettingTile(
                          icon: Icons.person,
                          title: "プロフィール",
                          function: () {},
                        ),
                        SettingTile(
                          icon: Icons.format_list_bulleted,
                          title: "フレンドリスト",
                          function: () {},
                        ),
                        SettingTile(
                          icon: Icons.format_list_bulleted,
                          title: "フレンドリスト",
                          function: () {},
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_add_alt,
                                size: 30,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text("フレンド追加"),
                              Spacer(),
                              Icon(
                                Icons.qr_code,
                                size: 25,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
