import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/theme/app_theme.dart';

class NormalButton extends HookConsumerWidget {
  const NormalButton({
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
      onTap: () async => await function(),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.fs16,
          ),
        ),
      ),
    );
  }
}
