import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../model/target/target_state.dart';
import '../../../../../view_model/saving_controller.dart';
import '../../../../theme/app_text_theme.dart';

enum KeyType {
  number,
  backSpeace,
  enter,
}

class CalculatorButton extends ConsumerWidget {
  const CalculatorButton({
    super.key,
    required this.aspectRatio,
    this.value,
    required this.keyType,
    required this.priceCTL,
    this.tagValue,
    required this.target,
  });
  final int? value;
  final double aspectRatio;
  final KeyType keyType;
  final TextEditingController priceCTL;
  final ValueNotifier<int?>? tagValue;
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final savingCTL =
        ref.watch(savingControllerProvider(target.docId).notifier);
    final saving = ref.watch(savingControllerProvider(target.docId));

    return saving.when(
      data: (data) {
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: InkWell(
            onTap: () async {
              await savingCTL.calcButtonFunction(
                keyType,
                value,
                priceCTL,
                tagValue,
                target,
                data,
                () {
                  context.pop();
                },
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              child: Center(
                child: keyType == KeyType.number
                    ? Text(
                        value.toString(),
                        style: font.fs27,
                      )
                    : keyType == KeyType.backSpeace
                        ? const Icon(
                            Icons.backspace_outlined,
                          )
                        : keyType == KeyType.enter
                            ? const Icon(
                                Icons.keyboard_return,
                              )
                            : const Icon(
                                Icons.error,
                              ),
              ),
            ),
          ),
        );
      },
      loading: () {
        return const SizedBox();
      },
      error: (e, s) {
        return const SizedBox();
      },
    );
  }
}
