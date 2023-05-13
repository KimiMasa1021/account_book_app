import 'package:account_book_app/application/providers/edit_tag_provider/provider/tags_provider.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/presentation/widgets/edit_tag/edit_tag_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/theme/app_text_theme.dart';

class EditTagPage extends ConsumerWidget {
  const EditTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final profile = ref.watch(profileNotifierProvider);
    final editTagCTL = ref.watch(editTagsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("タグの追加・編集"),
        actions: [
          IconButton(
            onPressed: () async => await editTagCTL.addTag(context),
            icon: const Icon(Icons.add, size: 35),
          )
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: profile.tags.length,
        onReorder: (int oldIndex, int newIndex) async =>
            await editTagCTL.onReorder(oldIndex, newIndex),
        itemBuilder: (cotnext, index) {
          return GestureDetector(
            key: Key(profile.tags[index]),
            child: EditTagPanel(
              index: index,
              tag: profile.tags[index],
              deleteFuc: () async =>
                  await editTagCTL.deleteTag(context, profile.tags[index]),
              editFuc: () async =>
                  await editTagCTL.editTagName(context, profile.tags[index]),
            ),
          );
        },
      ),
    );
  }
}
