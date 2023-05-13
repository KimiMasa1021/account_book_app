import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/theme/app_text_theme.dart';

class DrawerActionPanel extends ConsumerWidget {
  const DrawerActionPanel({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
  });
  final String title;
  final IconData icon;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () async {
        await function();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: font.fs21,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
