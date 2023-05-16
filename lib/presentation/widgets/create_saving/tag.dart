import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/create_saving_provider/provider/create_saving_provider.dart';
import '../../../common/theme/app_text_theme.dart';

class Tag extends ConsumerWidget {
  const Tag({
    super.key,
    required this.tag,
    required this.savingState,
  });
  final String tag;
  final SavingState? savingState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final createSaving = ref.watch(createSavingNotifierProvider);
    final createSavingCTL = ref.watch(createSavingNotifierProvider.notifier);

    return InkWell(
      onTap: () {
        createSavingCTL.changeTag(tag);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
              width: 10,
              child: Radio(
                value: tag,
                onChanged: (val) => createSavingCTL.changeTag(val!),
                groupValue: createSaving.tag,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              tag,
              style: font.fs16,
            )
          ],
        ),
      ),
    );
  }
}
