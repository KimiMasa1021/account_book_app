import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../utility/assets_url.dart';
import '../../../../common/theme/app_text_theme.dart';

class LoginLoading extends ConsumerWidget {
  const LoginLoading({
    super.key,
    required this.flg,
  });
  final bool flg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return flg == true
        ? Container(
            width: size.width,
            height: size.height,
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  LottieUrl.login.url,
                  width: 230,
                  height: 230,
                  frameRate: FrameRate(60),
                  repeat: true,
                ),
                Text(
                  "アカウント作成中です...",
                  style: font.fs19.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
