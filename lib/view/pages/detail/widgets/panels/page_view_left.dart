import 'package:account_book_app/view/pages/detail/widgets/graph_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../model/target/target_state.dart';
import '../../../../../view_model/saving_controller.dart';
import '../../../../theme/app_text_theme.dart';

class PageViewLeft extends HookConsumerWidget {
  const PageViewLeft({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saving = ref.watch(savingControllerProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final font = ref.watch(myTextTheme);
    final date = useState(DateTime.now());
    final savingList =
        saving.where((e) => e.productId == target.docId).toList();
    final dateDifference =
        target.targetDate.difference(target.registeTime).inDays;
    final week = [
      "月",
      "火",
      "水",
      "木",
      "金",
      "土",
      "日",
    ];
    int dailyPrice = (target.targetPrice / dateDifference).isInfinite
        ? 1
        : (target.targetPrice / dateDifference).round();
    final startWeekDate =
        date.value.subtract(Duration(days: date.value.weekday - 1));
    final endWeekDate = date.value.add(Duration(days: 7 - date.value.weekday));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      date.value = date.value.subtract(const Duration(days: 7));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_circle_left_outlined),
                    ),
                  ),
                  Text(
                    "${DateFormat('MM月dd日').format(startWeekDate)}から${DateFormat('MM月dd日').format(endWeekDate)}",
                    style: font.fs16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      date.value = date.value.add(const Duration(days: 7));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<int>>(
                future: savingCTL.culcWeeklyList(savingList, date),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  final doubleList = snapshot.data!;
                  return SizedBox(
                    height: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        7,
                        (index) {
                          double percent = doubleList[index] /
                              (target.targetPrice / dateDifference);

                          return GraphBar(
                            weekText: week[index],
                            percent: percent >= 1 ? 1 : percent,
                            price: doubleList[index],
                            barColor: Theme.of(context).colorScheme.secondary,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "１日当たり$dailyPrice円で達成できます",
                style: font.fs16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
