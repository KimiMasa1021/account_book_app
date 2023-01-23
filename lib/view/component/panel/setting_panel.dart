import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_text_theme.dart';

class SettingPanel extends HookConsumerWidget {
  const SettingPanel({
    super.key,
    required this.text,
    required this.function,
    required this.icon,
  });
  final String text;
  final Function() function;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () async {
        await function();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                icon,
                size: 35,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              text,
              style: font.fs16.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          ],
        ),
      ),
    );
  }
}
