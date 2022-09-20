import 'package:account_book_app/model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../component/auth/border_button.dart';
import '../../component/auth/painted_button.dart';
import '../../component/auth/pink_background.dart';
import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class Top extends HookConsumerWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(authSwitcherControllerProvider.notifier);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("FFF5E4"),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            const PinkBackGround(
              heightScale: 0.55,
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Container(
                width: size.width * 0.85,
                height: size.height * 0.65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "ようこそ",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      "絶対に貯まる",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      "家計簿アプリへ",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        children: [
                          PaintedButton(
                            function: () {
                              pageController.changePage(Pages.signIn);
                            },
                            title: 'ログイン',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "初めての方はこちら",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BorderButton(
                            function: () {
                              pageController.changePage(Pages.signIn);
                            },
                            title: 'アカウントを作成',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
