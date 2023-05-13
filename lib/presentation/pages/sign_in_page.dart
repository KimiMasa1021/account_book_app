import 'package:account_book_app/application/providers/url_luncher_provider/provider/url_luncher_provider.dart';
import 'package:account_book_app/presentation/widgets/common/loading.dart';
import 'package:account_book_app/presentation/widgets/common/shadow_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../application/providers/sign_in_provider/provider/sign_in_provider.dart';
import '../../common/theme/app_text_theme.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signIn = ref.watch(signInProvider);
    final signInCTL = ref.watch(signInProvider.notifier);
    final profileCTL = ref.watch(profileNotifierProvider.notifier);
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);
    final urlCTL = ref.watch(urlLuncherProvider.notifier);

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
                      await signInCTL.signInWithGoogle(
                        () => profileCTL.branchScreen(context),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async => urlCTL.openUrl(),
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
          Loading(flg: signIn.signInFlg)
        ],
      ),
    );
  }
}
