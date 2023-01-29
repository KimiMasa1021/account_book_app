import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/target/target_state.dart';
import '../../../theme/app_text_theme.dart';
import '../../../component/shapes.dart';

class AddTargetPanel extends HookConsumerWidget {
  const AddTargetPanel({
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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 120,
                  width: 45,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).cardColor,
                    shape: LeftShape(),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).cardColor,
                      shape: RightShape(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "新規プロジェクト",
                            style: font.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            "タップすることで新しいプロジェクトを作成することが出来ます！！",
                            style: font.fs16.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
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
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(top: 10, left: 11),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).cardColor,
              ),
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(Icons.add_circle_outline),
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
                  widthFactor: 0.75,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
