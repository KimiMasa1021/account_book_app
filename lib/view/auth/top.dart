import 'package:account_book_app/constant/enums.dart';
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
    final switcherController = ref.watch(authSwitcherPriovider.notifier);

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
                      "みんなで貯める貯金",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      "ミンチョキへ",
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
                              switcherController.state = Pages.signIn;
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Text(
                                    "初めての方はこちら",
                                    style: TextStyle(
                                      fontSize: 18,
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
                              switcherController.state = Pages.signUp;
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
