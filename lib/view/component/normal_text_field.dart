import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_text_theme.dart';

// ignore: must_be_immutable
class NormalTextField extends ConsumerWidget {
  NormalTextField({
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
    final font = ref.watch(myTextTheme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          topTitle,
          style: font.fs16.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: inputType,
              inputFormatters: formatter ?? [],
              decoration: InputDecoration(
                hintText: hintText,
                // hintStyle: theme.textTheme.fs19,
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        bottomTitle != ""
            ? Text(
                bottomTitle,
                // style: theme.textTheme.fs16,
              )
            : const SizedBox(),
      ],
    );
  }
}
