import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../model/enums.dart';

class LottieLoading extends HookConsumerWidget {
  const LottieLoading({
    super.key,
    required this.flg,
    required this.loadingPath,
    required this.loadingText,
    required this.resultPath,
    required this.resultText,
    required this.resultFunction,
  });
  final TargetInitFlg flg;
  final String loadingPath;
  final String loadingText;
  final String resultPath;
  final String resultText;
  final Function() resultFunction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final loadingLottie = Lottie.asset(
      loadingPath,
      width: 230,
      height: 230,
      frameRate: FrameRate(60),
      repeat: true,
    );

    final finishLottie = Lottie.asset(
      resultPath,
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
                              loadingText,
                              // style: theme.textTheme.fs19.copyWith(
                              //   fontWeight: FontWeight.bold,
                              // ),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            finishLottie,
                            Text(
                              resultText,
                              // style: theme.textTheme.fs19.copyWith(
                              //   fontWeight: FontWeight.bold,
                              // ),
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
                              // context.go(Routes.path().root);
                              resultFunction();
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "ホームに戻る",
                                  // style: theme.textTheme.fs19.copyWith(
                                  //   fontWeight: FontWeight.bold,
                                  // ),
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
