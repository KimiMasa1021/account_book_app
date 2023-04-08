import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/pages/init_tags/widget/painted_tag.dart';
import 'package:account_book_app/view_model/tags_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../theme/app_text_theme.dart';

class InitTags extends HookConsumerWidget {
  const InitTags({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final ValueNotifier<List<String>> selectedTags = useState([]);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "あなたに合った項目を選択してね",
                    style: font.fs21,
                    maxLines: 1,
                  ),
                  Text(
                    "あとから追加・編集・削除出来ます。",
                    style: font.fs16,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            ...List.generate(
                              tagsCTL.tagList.length,
                              (index) => PaintedTag(
                                title: tagsCTL.tagList[index],
                                selectedTags: selectedTags,
                              ),
                            ),
                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  if (selectedTags.value.length < 3) {
                    tagsCTL.shwoToast("３つ以上選択してね  ♥");
                    return;
                  }
                  await tagsCTL.insertTags(
                    selectedTags.value,
                    () {
                      context.go(Routes.path().root);
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "はじめる",
                      style: font.fs21.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
