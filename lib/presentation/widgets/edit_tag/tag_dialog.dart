import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';

class TagDialog extends HookConsumerWidget {
  const TagDialog({
    super.key,
    required this.dialogTitle,
    required this.hintText,
    required this.enterText,
    required this.onTap,
    this.initialText,
  });
  final String dialogTitle;
  final String hintText;
  final String enterText;
  final Function(String text) onTap;
  final String? initialText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final controller = useTextEditingController(text: initialText ?? "");
    final tag = useState(initialText ?? "");
    return Dialog(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dialogTitle,
                style: font.fs19,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  controller: controller,
                  style: font.fs16,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: EdgeInsets.zero,
                    isCollapsed: true,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    tag.value = val;
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  if (controller.text.isEmpty) return;
                  await onTap(controller.text);
                  context.pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: tag.value.isEmpty
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Center(
                    child: Text(
                      enterText,
                      style: font.fs16.copyWith(
                        color: tag.value.isEmpty
                            ? Colors.grey
                            : Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
