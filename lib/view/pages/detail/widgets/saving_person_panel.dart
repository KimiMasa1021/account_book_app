import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../model/saving/saving_state.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'saving_price_panel.dart';

class SavingPersonPanel extends HookConsumerWidget {
  const SavingPersonPanel({
    super.key,
    required this.name,
    required this.savingState,
  });
  final String name;
  final List<SavingState> savingState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final isOpen = useState(false);
    final price =
        savingState.map((e) => e.price).toList().reduce((e, v) => e + v);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    return InkWell(
      onTap: () {
        isOpen.value = !isOpen.value;
      },
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 30),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 10),
                        Text(
                          name,
                          style: font.fs16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          savingCTL.formatYen(price),
                          style: font.fs21.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Transform.rotate(
                      angle: isOpen.value ? 90 * pi / 180 : 0,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isOpen.value
                ? Column(
                    children: List.generate(
                      savingState.length,
                      (index) => SavingPricePanel(
                        state: savingState[index],
                      ),
                    ).toList(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
