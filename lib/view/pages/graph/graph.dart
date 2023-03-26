import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_text_theme.dart';

class Graph extends HookConsumerWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(
              "これまでの合計金額",
              style: font.fs16,
            ),
            RichText(
              text: TextSpan(
                style: font.fs27.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                children: [
                  const TextSpan(
                    text: "100,000",
                  ),
                  TextSpan(
                    text: '円',
                    style: font.fs21.copyWith(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
