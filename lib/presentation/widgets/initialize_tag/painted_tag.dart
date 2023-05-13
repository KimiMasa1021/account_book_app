import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/tags_provider/provider/tags_provider.dart';
import '../../../common/theme/app_text_theme.dart';

class PaintedTag extends HookConsumerWidget {
  const PaintedTag({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final tags = ref.watch(tagsProvider);
    final tagsCTL = ref.watch(tagsProvider.notifier);

    return InkWell(
      onTap: () => tagsCTL.switchTag(title),
      child: tags.tags.contains(title)
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
