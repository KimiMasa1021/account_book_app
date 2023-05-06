import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/presentation/widgets/create_saving/calculator_button.dart';
import 'package:account_book_app/presentation/widgets/create_saving/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/create_saving_provider/provider/create_saving_provider.dart';

class CustomKeyboard extends ConsumerWidget {
  const CustomKeyboard({
    super.key,
    required this.controller,
    required this.targetState,
  });

  final TextEditingController controller;
  final TargetState targetState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createSavingCTL = ref.watch(createSavingNotifierProvider.notifier);

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              CalculatorButton(
                value: 1,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 4,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 7,
                aspectRatio: 1,
                controller: controller,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CalculatorButton(
                value: 2,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 5,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 8,
                aspectRatio: 1,
                controller: controller,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CalculatorButton(
                value: 3,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 6,
                aspectRatio: 1,
                controller: controller,
              ),
              CalculatorButton(
                value: 9,
                aspectRatio: 1,
                controller: controller,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                onTap: () async => createSavingCTL.backspeacePrice(controller),
                aspectRatio: 1 / 2,
                child: const Icon(Icons.backspace_outlined),
              ),
              CalculatorButton(
                value: 0,
                aspectRatio: 1,
                controller: controller,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                onTap: () async =>
                    createSavingCTL.enterPrice(targetState.productId),
                aspectRatio: 1 / 3,
                child: const Icon(Icons.keyboard_return_outlined),
              )
            ],
          ),
        ),
      ],
    );
  }
}
