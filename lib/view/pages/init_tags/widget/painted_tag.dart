import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/app_text_theme.dart';

class PaintedTag extends HookConsumerWidget {
  const PaintedTag({
    super.key,
    required this.title,
    required this.selectedTags,
  });
  final String title;
  final ValueNotifier<List<String>> selectedTags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () {
        if (selectedTags.value.contains(title)) {
          final tags = selectedTags.value;
          tags.removeWhere((element) => element == title);
          selectedTags.value = [...tags];
        } else {
          selectedTags.value = [...selectedTags.value, title];
        }
      },
      child: selectedTags.value.contains(title)
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                title,
                style: font.fs16.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(),
              ),
              child: Text(
                title,
                style: font.fs16,
              ),
            ),
    );
  }
}
