import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_text_theme.dart';

// ignore: must_be_immutable
class LargeTextField extends ConsumerWidget {
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            inputFormatters: formatter ?? [],
            maxLines: 3,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
              isCollapsed: true,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ),
        bottomTitle != ""
            ? Text(
                bottomTitle,
              )
            : const SizedBox(),
      ],
    );
  }
}
