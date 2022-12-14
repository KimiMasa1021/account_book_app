import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/theme/app_theme.dart';

class NormalTextField extends HookConsumerWidget {
  const NormalTextField({
    super.key,
    required this.topTitle,
    required this.bottomTitle,
    required this.hintText,
    required this.inputType,
    required this.controller,
  });
  final String topTitle;
  final String bottomTitle;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(topTitle, style: theme.textTheme.fs16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: inputType,
              obscureText:
                  inputType == TextInputType.visiblePassword ? true : false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.textTheme.fs19,
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        bottomTitle != ""
            ? Text(bottomTitle, style: theme.textTheme.fs16)
            : const SizedBox(),
      ],
    );
  }
}
