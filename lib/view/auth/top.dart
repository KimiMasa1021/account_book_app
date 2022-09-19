import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../constant/hex_color.dart';
import '../../view_core/auth/pink_background.dart';
import '../routes/app_route.gr.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
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
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(const SignIn());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 58,
                              decoration: BoxDecoration(
                                color: HexColor("850E35"),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(123),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "ログイン",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
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
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(const SignUp());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 58,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(123),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: HexColor("850E35"),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "アカウントを作成",
                                  style: TextStyle(
                                    color: HexColor("850E35"),
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
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
