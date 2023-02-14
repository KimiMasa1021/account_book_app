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
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 35,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: tagsCTL.getTags(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {},
              children: List.generate(
                tags.length,
                (index) => GestureDetector(
                  key: Key(tags[index].id.toString()),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 13,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.drag_handle),
                        ),
                        Expanded(
                          child: Text(
                            tags[index].tag,
                            style: font.fs19.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            debugPrint("消す！！");
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.delete_outline),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            debugPrint("消す！！");
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
