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
                    title: Text('メンバーを選択してください'),
                    content: CreateTargetMember(),
                  ),
                  Step(
                    title: Text('プロジェクトの詳細'),
                    content: CreateTargetDetail(),
                  ),
                  Step(
                    title: Text('画像の設定'),
                    content: CreateTargetImage(),
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
