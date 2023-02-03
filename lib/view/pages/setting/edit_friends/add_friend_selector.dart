import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/shadow_button.dart';
import '../../../../provider/route/routes.dart';
import '../../../theme/app_text_theme.dart';

class FriendsAddDescription extends ConsumerWidget {
  const FriendsAddDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

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
                children: [
                  Text(
                    "フレンド追加",
                    style: font.fs27,
                  ),
                  Text(
                    "フレンド追加をすることでプロジェクトに招待することが出来ます。",
                    style: font.fs19,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ShadowButton(
              text: "QRコードで追加",
              function: () {
                context.pushNamed(Routes.name().scanQr);
              },
            ),
            const SizedBox(height: 20),
            ShadowButton(
              text: "IDで検索して追加",
              function: () {
                context.pushNamed(Routes.name().friendSearch);
              },
            ),
          ],
        ),
      ),
    );
  }
}
