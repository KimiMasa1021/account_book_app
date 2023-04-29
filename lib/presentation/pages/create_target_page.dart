import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/create_target_provider/provider/create_target_provider.dart';

class CreateTargetPage extends ConsumerWidget {
  const CreateTargetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                currentStep: createTarget.stepperIndex,
                type: StepperType.horizontal,
                onStepContinue: () => createTargetCTL.onStepContinue(),
                onStepCancel: () => createTargetCTL.onStepCancel(),
                steps: [
                  Step(
                    title: const Text(''),
                    content: Container(
                      child: const Text('1'),
                    ),
                  ),
                  Step(
                    title: const Text(''),
                    content: Container(
                      child: const Text('2'),
                    ),
                  ),
                  Step(
                    title: const Text(''),
                    content: Container(
                      child: const Text('3'),
                    ),
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
