import 'package:account_book_app/application/providers/create_saving_provider/provider/create_saving_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view/theme/app_text_theme.dart';

class CalculatorButton extends ConsumerWidget {
  const CalculatorButton({
    super.key,
    required this.aspectRatio,
    this.value,
    required this.controller,
  });
  final int? value;
  final double aspectRatio;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final createSavingCTL = ref.watch(createSavingNotifierProvider.notifier);

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: InkWell(
        onTap: () async {
          createSavingCTL.updatePrice(value!, controller);
        },
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: font.fs27,
            ),
          ),
        ),
      ),
    );
  }
}
