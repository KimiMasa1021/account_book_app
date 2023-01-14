import 'package:account_book_app/view/pages/home/add_project/target_add_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../constant/hex_color.dart';
import '../../../../provider/route/routes.dart';
import '../../../theme/app_theme.dart';

class LottieLoading extends HookConsumerWidget {
  const LottieLoading({
    super.key,
    required this.flg,
  });
  final TargetInitFlg flg;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = ref.watch(appThemeProvider);

    final loadingLottie = Lottie.asset(
      'assets/json/cat_loading.json',
      width: 230,
      height: 230,
      frameRate: FrameRate(60),
      repeat: true,
    );

    final finishLottie = Lottie.asset(
      'assets/json/complete.json',
      width: 230,
      height: 230,
      frameRate: FrameRate(60),
      repeat: false,
    );

    return flg == TargetInitFlg.creating || flg == TargetInitFlg.complete
        ? Material(
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: flg == TargetInitFlg.creating
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loadingLottie,
                            Text(
                              "作成中...",
                              style: theme.textTheme.fs19.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            finishLottie,
                            Text(
                              "作成できました",
                              style: theme.textTheme.fs19.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
                flg == TargetInitFlg.complete
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: InkWell(
                            onTap: () {
                              context.go(Routes.path().root);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                color: HexColor("#296BFF"),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "ホームに戻る",
                                  style: theme.textTheme.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          )
        : const SizedBox();
  }
}
