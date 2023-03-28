import 'package:account_book_app/view/pages/statistic/widget/info_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../model/saving/saving_state.dart';
import '../../../view_model/all_saving_controller.dart';
import '../../theme/app_text_theme.dart';
import 'widget/tag_panel.dart';

class Statistic extends HookConsumerWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final allSaving = ref.watch(allSavingControllerProvider);
    return SingleChildScrollView(
      child: allSaving.when(
        data: (data) {
          //合計金額
          final sum = data.map((e) => e.price).reduce((v, e) => v + e);
          //節約回数
          final savedTimes = data.length;
          //タグ別のリスト
          final listByTag = data.map((e) {
            final list = data.where((f) => f.memo == e.memo).toList();
            if (list.isNotEmpty) {
              return list;
            }
          }).toList();

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "あなたの統計",
                    style: font.fs21.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InfoPanel(
                    icon: Icons.savings_outlined,
                    title: '節約合計金額',
                    text: sum.toString(),
                    unit: "円",
                  ),
                  InfoPanel(
                    icon: Icons.heart_broken_sharp,
                    title: '節約回数',
                    text: savedTimes.toString(),
                    unit: "回",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "タグ別の金額",
                    style: font.fs16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const TagPanel(),
                  ...List.generate(
                    listByTag.length,
                    (index) => TagPanel(
                      text: listByTag[index]![0].memo,
                      state: [],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () {},
        error: (e, s) {},
      ),
    );
  }
}
