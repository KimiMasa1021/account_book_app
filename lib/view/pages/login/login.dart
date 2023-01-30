import 'package:account_book_app/view/component/shadow_button.dart';
import 'package:account_book_app/view/pages/web_view/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../model/enums.dart';
import '../../../view_model/auth_controller.dart';
import '../../../view_model/tags_controller.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final size = MediaQuery.of(context).size;
    final flg = useState(false);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "仮の名前",
                    // style: theme.textTheme.fs33.copyWith(
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  const Text(
                    "仮の簡単な説明仮の\n仮の簡単な説明仮の仮の",
                    // style: theme.textTheme.fs21,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  ShadowButton(
                    text: "Googleでサインアップ",
                    function: () async {
                      flg.value = true;
                      final newUser = await authCTL.signInWithGoogle();
                      if (newUser || tags.isEmpty) {
                        await tagsCTL.insertTags();
                      }
                      flg.value = false;
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(
                            type: WebViewType.privacyPolicy,
                          ),
                        ),
                      );
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
          flg.value == true
              ? Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
