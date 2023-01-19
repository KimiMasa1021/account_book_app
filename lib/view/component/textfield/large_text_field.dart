import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/v1/app_theme.dart';

class LargeTextField extends HookConsumerWidget {
  LargeTextField({
    super.key,
    required this.topTitle,
    required this.bottomTitle,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.formatter,
  });
  final String topTitle;
  final String bottomTitle;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(topTitle, style: theme.textTheme.fs16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#E1EBFF"),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            inputFormatters: formatter ?? [],
            maxLines: 3,
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
        bottomTitle != ""
            ? Text(bottomTitle, style: theme.textTheme.fs16)
            : const SizedBox(),
      ],
    );
  }
}
