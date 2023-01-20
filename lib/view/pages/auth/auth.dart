import 'package:account_book_app/view/component/button/shadow_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/route/routes.dart';
import '../../../view_model/auth_controller.dart';
import '../../../view_model/tags_controller.dart';

class Auth extends HookConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/736x/63/cd/98/63cd989ececcace76faa147586f2fa47--nice.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "仮の名前",
                    // style: theme.textTheme.fs33.copyWith(
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  Text(
                    "仮の簡単な説明仮の\n仮の簡単な説明仮の仮の",
                    // style: theme.textTheme.fs21,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  ShadowButton(
                    text: "Googleでサインアップ",
                    function: () async {
                      final newUser = await authCTL.signInWithGoogle();
                      if (newUser || tags.isEmpty) {
                        await tagsCTL.insertTags();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  ShadowButton(
                    text: "Appleでサインアップ",
                    function: () {},
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      context.goNamed(Routes.name().privacyPolicy);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("利用規約"),
                        Text(" | "),
                        Text("プライバシーポリシー"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
