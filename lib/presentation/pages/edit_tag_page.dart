import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/presentation/widgets/edit_tag/edit_tag_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/theme/app_text_theme.dart';

class EditTagPage extends ConsumerWidget {
  const EditTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final profile = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("タグの追加・編集"),
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return TagDialog(
              //       dialogTitle: '新しいタグの作成',
              //       enterText: '作成する',
              //       hintText: 'タグの名前',
              //       onTap: (tag) async {
              //         await tagsCTL.createTag(tag);
              //       },
              //     );
              //   },
              // );
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          )
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: profile.tags.length,
        onReorder: (int oldIndex, int newIndex) async {
          // if (oldIndex < newIndex) {
          //   newIndex -= 1;
          // }
          // final test = tags;
          // final item = test.removeAt(oldIndex);
          // test.insert(newIndex, item);
          // // await tagsCTL.sortTags(test);
        },
        itemBuilder: (cotnext, index) {
          return GestureDetector(
            key: Key(profile.tags[index]),
            child: EditTagPanel(
              index: index,
              tag: profile.tags[index],
              deleteFuc: () {},
              editFuc: () {},
            ),
          );
        },
      ),
    );
  }
}
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return DeleteDialog(
              //       dialogTitle: "タグを削除しますか？",
              //       tagText: tags[index].tag,
              //       onTap: () async {
              //         await tagsCTL.deleteTag(tags[index].id);
              //       },
              //     );
              //   },
              // );

                            // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return TagDialog(
              //       dialogTitle: 'タグの編集',
              //       enterText: '編集する',
              //       hintText: 'タグの名前',
              //       initialText: tags[index].tag,
              //       onTap: (tag) async {
              //         await tagsCTL.updateTag(tag, tags[index].id);
              //       },
              //     );
              //   },
              // );