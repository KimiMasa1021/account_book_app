import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/theme/app_text_theme.dart';

class EditTagPanel extends ConsumerWidget {
  const EditTagPanel({
    super.key,
    required this.index,
    required this.tag,
    required this.deleteFuc,
    required this.editFuc,
  });
  final int index;
  final String tag;
  final Function() deleteFuc;
  final Function() editFuc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 13,
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ReorderableDragStartListener(
            index: index,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.drag_handle),
            ),
          ),
          Expanded(
            child: Text(
              tag,
              style: font.fs19.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () async => await deleteFuc(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.delete_outline),
            ),
          ),
          InkWell(
            onTap: () async => await editFuc(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
