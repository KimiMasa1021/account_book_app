import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/theme/app_text_theme.dart';

class PaintedButton extends HookConsumerWidget {
  const PaintedButton({
    super.key,
    required this.text,
    required this.fucntion,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.red,
    this.borderColor = Colors.red,
  });
  final String text;
  final Function() fucntion;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () async {
        await fucntion();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
          border: Border.all(
            width: 3,
            color: borderColor!,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: font.fs16.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
