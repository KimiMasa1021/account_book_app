import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/create_target_provider/provider/create_target_provider.dart';
import '../widgets/create_target/create_target_detail.dart';
import '../widgets/create_target/create_target_image.dart';
import '../widgets/create_target/create_target_member.dart';

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
                type: StepperType.vertical,
                onStepContinue: () => createTargetCTL.onStepContinue(),
                onStepCancel: () => createTargetCTL.onStepCancel(),
                steps: const [
                  Step(
                    title: Text('メンバーを選択してね'),
                    content: CreateTargetMember(),
                  ),
                  Step(
                    title: Text('詳細を教えてね'),
                    content: CreateTargetDetail(),
                  ),
                  Step(
                    title: Text('画像はどうする？'),
                    content: CreateTargetImage(),
                  ),
                ],
                controlsBuilder: (context, details) {
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
                              if (!createTarget.target.isValid) return;
                              details.onStepContinue!.call();
                            },
                            child: const Text("つぎへ"),
                          ),
                        ],
                      );
                    case 2:
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
                                onPressed: () {},
                                child: const Text("作成する！"),
                              ),
                            ],
                          ),
                        ],
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
