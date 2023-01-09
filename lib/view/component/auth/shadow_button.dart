import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constant/hex_color.dart';
import '../../theme/app_theme.dart';

class ShadowButton extends HookConsumerWidget {
  const ShadowButton({
    super.key,
    required this.text,
    required this.function,
  });

  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return InkWell(
      onTap: () async {
        await function();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
              color: HexColor("#00F741"),
            ),
          ),
          Positioned(
            top: -5,
            left: -5,
            right: 5,
            bottom: 5,
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  text,
                  style: theme.textTheme.fs19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
