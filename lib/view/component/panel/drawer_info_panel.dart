import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerInfoPanel extends HookConsumerWidget {
  const DrawerInfoPanel({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });
  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                // style: theme.textTheme.fs16,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                content,
                // style: theme.textTheme.fs21.copyWith(
                //   fontWeight: FontWeight.bold,
                // ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
