import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/theme/app_text_theme.dart';

class NormalTextField extends ConsumerWidget {
  const NormalTextField({
    super.key,
    required this.topTitle,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.formatter,
    required this.editable,
    required this.onChanged,
  });
  final String topTitle;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final bool editable;
  final Function(String val) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topTitle,
            style: font.fs16.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 5),
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
                enabled: editable,
                controller: controller,
                keyboardType: inputType,
                inputFormatters: formatter ?? [],
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: EdgeInsets.zero,
                  isCollapsed: true,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 19),
                onChanged: (val) => onChanged(val),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
