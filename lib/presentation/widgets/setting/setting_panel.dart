import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Icon(
                icon,
                size: 25,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: font.fs16.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}
