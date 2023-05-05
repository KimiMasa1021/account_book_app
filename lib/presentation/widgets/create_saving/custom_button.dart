import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view/theme/app_text_theme.dart';

class CustomButton extends ConsumerWidget {
  const CustomButton({
    super.key,
    required this.aspectRatio,
    required this.child,
    required this.onTap,
  });
  final double aspectRatio;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: InkWell(
        onTap: () async => await onTap(),
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
          child: child,
        ),
      ),
    );
  }
}
