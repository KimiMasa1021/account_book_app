import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../common/theme/app_text_theme.dart';

class LottieDialog extends ConsumerWidget {
  const LottieDialog({
    super.key,
    required this.url,
    required this.title,
    required this.subTitle,
    required this.button1Title,
    required this.onTap1,
    required this.onTap2,
  });

  final String url;
  final String title;
  final String subTitle;
  final String button1Title;
  final Function() onTap1;
  final Function() onTap2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        height: size.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(
                url,
                width: size.width / 3,
                height: size.width / 3,
                frameRate: FrameRate(60),
                repeat: true,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: font.fs21.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subTitle,
                        style: font.fs19.copyWith(),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      // PaintedButton(
                      //   text: button1Title,
                      //   textColor: Theme.of(context).colorScheme.onBackground,
                      //   backgroundColor:
                      //       Theme.of(context).colorScheme.background,
                      //   borderColor: Theme.of(context).colorScheme.surface,
                      //   fucntion: () async => await onTap1(),
                      // ),
                      // const SizedBox(height: 10),
                      // PaintedButton(
                      //   text: 'キャンセル',
                      //   textColor: Theme.of(context).colorScheme.onSurface,
                      //   backgroundColor: Theme.of(context).colorScheme.surface,
                      //   borderColor: Theme.of(context).cardColor,
                      //   fucntion: () => onTap2(),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
