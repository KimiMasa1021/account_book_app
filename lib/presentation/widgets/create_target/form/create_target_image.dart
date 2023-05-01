import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../application/providers/create_target_provider/provider/create_target_provider.dart';
import '../../../../view/theme/app_text_theme.dart';

class CreateTargetImage extends ConsumerWidget {
  const CreateTargetImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final createTarget = ref.watch(createTargetNotifierProvider);
    final font = ref.watch(myTextTheme);
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: size.width / 3,
              height: size.width / 3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: FittedBox(
                child: Text(
                  createTarget.target.value.isNotEmpty
                      ? createTarget.target.value.substring(0, 1)
                      : "",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
