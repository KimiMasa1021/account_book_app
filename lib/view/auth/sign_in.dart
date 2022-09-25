import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/auth/border_button.dart';
import '../../component/auth/icon_textfield.dart';
import '../../component/auth/painted_button.dart';
import '../../component/auth/pink_background.dart';
import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final ValueNotifier<bool> loading = useState(false);

    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

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
                  heightScale: 0.4,
                  title: "ログイン",
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width * 0.85,
                      height: size.height * 0.6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                            PaintedButton(
                              function: () async {
                                FocusScope.of(context).unfocus();
                                loading.value = true;
                                try {
                                  final email = emailController.text;
                                  final passwrod = passwordController.text;

                                  await authController.signIn(
                                      email, passwrod, loading);
                                  loading.value = false;
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              title: 'ログイン',
                            ),
                            const SizedBox(height: 10),
                            //Googleで作成
                            BorderButton(
                              function: () {},
                              title: 'Googleでログイン',
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
