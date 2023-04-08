import 'package:account_book_app/view/pages/detail/add_tag/widget/delete_dialog.dart';
import 'package:account_book_app/view/pages/detail/add_tag/widget/tag_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../view_model/tags_controller.dart';
import '../../../theme/app_text_theme.dart';

class AddTag extends ConsumerWidget {
  const AddTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("タグの追加・編集"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return TagDialog(
                    dialogTitle: '新しいタグの作成',
                    enterText: '作成する',
                    hintText: 'タグの名前',
                    onTap: (tag) async {
                      await tagsCTL.createTag(tag);
                    },
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: tagsCTL.getTags(),
        builder: (context, snapshot) {
          return ReorderableListView.builder(
            itemCount: tags.length,
            onReorder: (int oldIndex, int newIndex) async {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final test = tags;
              final item = test.removeAt(oldIndex);
              test.insert(newIndex, item);
              await tagsCTL.sortTags(test);
            },
            itemBuilder: (cotnext, index) {
              return GestureDetector(
                key: Key(tags[index].id.toString()),
                child: Container(
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
                          tags[index].tag,
                          style: font.fs19.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DeleteDialog(
                                dialogTitle: "タグを削除しますか？",
                                tagText: tags[index].tag,
                                onTap: () async {
                                  await tagsCTL.deleteTag(tags[index].id);
                                },
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.delete_outline),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return TagDialog(
                                dialogTitle: 'タグの編集',
                                enterText: '編集する',
                                hintText: 'タグの名前',
                                initialText: tags[index].tag,
                                onTap: (tag) async {
                                  await tagsCTL.updateTag(tag, tags[index].id);
                                },
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
