import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../view/theme/app_text_theme.dart';

class Loading extends ConsumerWidget {
  const Loading({
    super.key,
    required this.flg,
  });
  final bool flg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return flg
        ? Material(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/json/cat_loading.json",
                    width: 230,
                    height: 230,
                    frameRate: FrameRate(60),
                    repeat: true,
                  ),
                  Text(
                    "Loading...",
                    style: font.fs19.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
