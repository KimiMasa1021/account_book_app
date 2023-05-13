import 'package:account_book_app/application/providers/tags_provider/provider/tags_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/theme/app_text_theme.dart';
import '../widgets/common/loading.dart';
import '../widgets/initialize_tag/painted_tag.dart';

class InitTagPage extends ConsumerWidget {
  const InitTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final tags = ref.watch(tagsProvider);
    final tagsCTL = ref.watch(tagsProvider.notifier);

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
                    "あなたに合った節約項目を選択してね",
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
                              tagsCTL.initTagList.length,
                              (index) => PaintedTag(
                                title: tagsCTL.initTagList[index],
                              ),
                            ),
                            const SizedBox(height: 300),
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
                onTap: () async => tagsCTL.initializeTag(
                  () {
                    tagsCTL.goHome(context);
                  },
                ),
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
            Loading(flg: tags.isLoading)
          ],
        ),
      ),
    );
  }
}
