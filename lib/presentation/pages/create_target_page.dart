import 'package:account_book_app/presentation/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/create_target_provider/provider/create_target_provider.dart';
import '../widgets/create_target/form/create_target_date.dart';
import '../widgets/create_target/form/create_target_detail.dart';
import '../widgets/create_target/form/create_target_image.dart';
import '../widgets/create_target/form/create_target_member.dart';
import '../widgets/create_target/stepper_controller.dart';

class CreateTargetPage extends ConsumerWidget {
  const CreateTargetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
                        title: Text('いつまでに達成したいですか？'),
                        content: CreateTargetDate(),
                      ),
                      Step(
                        title: Text('画像はどうする？'),
                        content: CreateTargetImage(),
                      ),
                    ],
                    controlsBuilder: (context, details) => StepperController(
                      details: details,
                    ),
                  ),
                )
              ],
            ),
          ),
          Loading(flg: createTarget.isLoading),
        ],
      ),
    );
  }
}
