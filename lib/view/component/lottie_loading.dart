import 'package:account_book_app/view/component/my_lottie_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../model/enums.dart';
import '../../common/theme/app_text_theme.dart';

class LottieLoading extends ConsumerWidget {
  const LottieLoading({
    super.key,
    required this.flg,
    required this.lottieData,
    required this.resultFunction,
  });
  final TargetInitFlg flg;
  final MyLottieData lottieData;
  final Function() resultFunction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    final loadingLottie = Lottie.asset(
      lottieData.loadingPath,
      width: 230,
      height: 230,
      frameRate: FrameRate(60),
      repeat: true,
    );
    final finishLottie = Lottie.asset(
      lottieData.resultPath,
      width: 230,
      height: 230,
      frameRate: FrameRate(60),
      repeat: false,
    );

    return flg == TargetInitFlg.creating || flg == TargetInitFlg.complete
        ? Material(
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: flg == TargetInitFlg.creating
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loadingLottie,
                            Text(
                              lottieData.loadingText,
                              style: font.fs19.copyWith(
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
                              lottieData.resultText,
                              style: font.fs19.copyWith(
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
                              resultFunction();
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child: Center(
                                child: Text(
                                  "ホームに戻る",
                                  style: font.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
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
