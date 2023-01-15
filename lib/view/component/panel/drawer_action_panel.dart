import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../theme/app_theme.dart';

class DrawerActionPanel extends HookConsumerWidget {
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
    final theme = ref.watch(appThemeProvider);
    return InkWell(
      onTap: () async {
        await function();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.fs21,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
