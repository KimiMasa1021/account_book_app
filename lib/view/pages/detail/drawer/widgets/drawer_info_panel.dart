import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/app_text_theme.dart';

class DrawerInfoPanel extends ConsumerWidget {
  const DrawerInfoPanel({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });
  final IconData icon;
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: font.fs16,
                  overflow: TextOverflow.ellipsis,
                ),
                content
              ],
            ),
          )
        ],
      ),
    );
  }
}
