import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/create_target_provider/provider/create_target_provider.dart';

class StepperController extends ConsumerWidget {
  const StepperController({super.key, required this.details});
  final ControlsDetails details;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);

    switch (details.currentStep) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                details.onStepContinue!.call();
              },
              child: const Text("つぎへ"),
            )
          ],
        );
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                details.onStepCancel!.call();
              },
              child: const Text("もどる"),
            ),
            FilledButton(
              onPressed: () {
                if (!createTarget.target.isValid && createTarget.price == 0) {
                  return;
                }
                details.onStepContinue!.call();
              },
              child: const Text("つぎへ"),
            ),
          ],
        );
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                details.onStepCancel!.call();
              },
              child: const Text("もどる"),
            ),
            FilledButton(
              onPressed: () {
                if (!createTarget.targetDate.isValid) {
                  return;
                }
                details.onStepContinue!.call();
              },
              child: const Text("つぎへ"),
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    details.onStepCancel!.call();
                  },
                  child: const Text("もどる"),
                ),
                FilledButton(
                  onPressed: () async {
                    await createTargetCTL.addTarget();
                  },
                  child: const Text("作成する！"),
                ),
              ],
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
