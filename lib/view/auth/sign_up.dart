import 'package:account_book_app/provider/general_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../component/auth/border_button.dart';
import '../../component/auth/icon_textfield.dart';
import '../../component/auth/painted_button.dart';
import '../../component/auth/pink_background.dart';
import '../../constant/hex_color.dart';

class SignUp extends HookConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final nameController = useTextEditingController(text: '');
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    final ValueNotifier<bool> loading = useState(false);

    final authController = ref.watch(authControllerProvider.notifier);

    return Scaffold(
      backgroundColor: HexColor("FFF5E4"),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                const PinkBackGround(
                  heightScale: 0.7,
                  title: "新規登録",
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.65,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconTextField(
                              controller: nameController,
                              hintText: 'ニックネーム',
                              icon: Icons.badge_outlined,
                              type: TextInputType.name,
                            ),
                            const SizedBox(height: 20),
                            IconTextField(
                              controller: emailController,
                              hintText: 'メールアドレス',
                              icon: Icons.mail_outline_rounded,
                              type: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            IconTextField(
                              controller: passwordController,
                              hintText: 'パスワード',
                              icon: Icons.lock_open_outlined,
                              type: TextInputType.visiblePassword,
                            ),
                            const Spacer(),
                            //アカウント作成
                            PaintedButton(
                              function: () async {
                                FocusScope.of(context).unfocus();
                                loading.value = true;
                                try {
                                  final email = emailController.text;
                                  final password = passwordController.text;
                                  final name = nameController.text;

                                  await authController.signUp(
                                    email,
                                    password,
                                    name,
                                    loading,
                                  );
                                  loading.value = false;
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              title: 'アカウント作成',
                            ),
                            const SizedBox(height: 10),
                            BorderButton(
                              function: () async {
                                loading.value = true;
                                try {
                                  await authController
                                      .signUpWithGoogle(loading);
                                  loading.value = false;
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              title: 'Googleで作成',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          loading.value
              ? Container(
                  color: Colors.grey.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
