import 'package:account_book_app/model/tags_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_theme.dart';

class Tag extends HookConsumerWidget {
  const Tag({
    super.key,
    required this.tagValue,
    required this.tag,
  });
  final ValueNotifier<int?> tagValue;
  final Tags tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flg = useState(false);
    final theme = ref.watch(appThemeProvider);

    return InkWell(
      onTap: () {
        tagValue.value = tag.id;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
              width: 10,
              child: Radio(
                value: tag.id,
                onChanged: (val) {
                  tagValue.value = val;
                },
                groupValue: tagValue.value,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              tag.tag,
              style: theme.textTheme.fs19,
            )
          ],
        ),
      ),
    );
  }
}
