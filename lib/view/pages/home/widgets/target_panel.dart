import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/target/target_state.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../theme/app_text_theme.dart';
import '../../../component/shapes.dart';

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
    final saving = ref.watch(savingControllerProvider);
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);
    final priceList = saving
        .where((e) => e.productId == state.docId)
        .map((e) => e.price)
        .toList();
    int sum;
    if (priceList.isEmpty) {
      sum = 0;
    } else {
      sum = priceList.reduce((a, b) => a + b);
    }
    final percent = sum / state.targetPrice;
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.target,
                            style: font.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            state.targetDescription,
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
                foregroundImage:
                    state.img != "" ? NetworkImage(state.img) : null,
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
                  widthFactor: percent >= 1.0 ? 1.0 : percent,
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
