import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';

class SettingPanel extends ConsumerWidget {
  const SettingPanel({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () async => await onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: font.fs19,
            ),
          ],
        ),
      ),
    );
  }
}
