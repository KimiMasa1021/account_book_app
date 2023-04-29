import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';
import 'shapes.dart';

class CreateTargetPanel extends HookConsumerWidget {
  const CreateTargetPanel({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () async => onTap(),
      child: Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 120,
                  width: 45,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: LeftShape(),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: RightShape(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "新規プロジェクトの追加",
                            style: font.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            "新しいプロジェクトを作成はこちらから！！",
                            style: font.fs16.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 11),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                radius: 35,
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Positioned(
              bottom: 8.5,
              left: 11,
              child: SizedBox(
                height: 18,
                width: size.width - 52,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.2,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
