import 'package:account_book_app/presentation/widgets/list/shapes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/target_provider/state/target_state.dart';
import '../../../common/theme/app_text_theme.dart';

class TargetPanel extends HookConsumerWidget {
  const TargetPanel({
    super.key,
    required this.state,
    required this.function,
  });

  final TargetState state;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);
    return InkWell(
      onTap: () async {
        await function();
      },
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.target,
                            style: font.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 2,
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
                foregroundImage: state.imageUrl != ""
                    ? CachedNetworkImageProvider(
                        state.imageUrl,
                      )
                    : null,
                child: Text(
                  state.target.substring(0, 2),
                  style: font.fs19.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
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
                  widthFactor: state.currentPercent,
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
