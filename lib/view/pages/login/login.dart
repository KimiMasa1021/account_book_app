import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/component/shadow_button.dart';
import 'package:account_book_app/view/pages/login/widget/login_loading.dart';
import 'package:account_book_app/view/pages/web_view/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view_model/auth_controller.dart';
import '../../../view_model/tags_controller.dart';
import '../../theme/app_text_theme.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final flg = useState(false);
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image(
                      width: size.width / 5,
                      image:
                          const AssetImage("assets/img/png_jpg/login_icon.png"),
                    ),
                  ),
                  Text(
                    "Savegy(サベジー)へようこそ！",
                    style: font.fs19.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Savegyは、共同貯金箱アプリであり、目標と目標金額を設定し、日々の節約を記録して目標達成を目指すことができます。",
                    style: font.fs19.copyWith(),
                  ),
                  const Spacer(),
                  ShadowButton(
                    text: "Googleでサインアップ",
                    function: () async {
                      flg.value = true;
                      await authCTL.signInWithGoogle();
                      if (tags.isEmpty) await tagsCTL.insertTags();
                      await authCTL.deryFuture(() {
                        flg.value = false;
                        context.go(Routes.path().root);
                      });
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
          LoginLoading(flg: flg),
        ],
      ),
    );
  }
}
