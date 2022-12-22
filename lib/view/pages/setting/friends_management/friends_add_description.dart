import 'package:account_book_app/view/pages/setting/friends_management/friends_qr_scan.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../component/auth/shadow_button.dart';

class FriendsAddDescription extends StatelessWidget {
  const FriendsAddDescription({super.key});
  static String name = "friends_add_description";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンド追加"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("フレンド追加"),
                  Text(
                    "フレンド追加をすることで同じプロジェクトに招待することが出来ます。",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ShadowButton(
              text: "QRコードで追加",
              function: () {
                context.pushNamed(FriendsQrScan.name);
              },
            ),
            const SizedBox(height: 20),
            ShadowButton(
              text: "メールアドレスで検索して追加",
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
