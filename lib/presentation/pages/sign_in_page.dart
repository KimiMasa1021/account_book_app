import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/component/shadow_button.dart';
import 'package:account_book_app/view/pages/login/widget/login_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utility/web_url.dart';
import '../../../view_model/auth_controller.dart';
import '../../../view_model/tags_controller.dart';
import '../../view/theme/app_text_theme.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final tags = ref.watch(tagsControllerProvider);
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
                      final authFlg = await authCTL.signInWithGoogle();
                      await authCTL.branchBySignin(
                        authFlg,
                        tags,
                        () {
                          context.go(Routes.path().initTags);
                        },
                        () {
                          context.go(Routes.path().root);
                        },
                      );
                      flg.value = false;
                    },
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (!await launchUrl(
                        Uri.parse(WebViewType.appHint.url),
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch');
                      }
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
