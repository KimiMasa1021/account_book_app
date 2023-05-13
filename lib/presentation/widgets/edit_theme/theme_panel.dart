import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/theme_provider/provider/tags_provider.dart';
import '../../../common/theme/my_theme_mode.dart';

class ThemePanel extends ConsumerWidget {
  const ThemePanel({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Stack(
      children: [
        InkWell(
          onTap: () async => await onTap(),
          child: Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      color: ExThemeMode
                          .values[index].themeData.colorScheme.tertiary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ExThemeMode
                          .values[index].themeData.colorScheme.secondary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: ExThemeMode.values[index].themeData.cardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 20,
          child: Container(
            height: 40,
            width: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme != ExThemeMode.values[index]
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
