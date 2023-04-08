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
    final saving = ref.watch(savingControllerProvider(target.docId));
    final savingCTL =
        ref.watch(savingControllerProvider(target.docId).notifier);
    final font = ref.watch(myTextTheme);
    final date = useState(DateTime.now());

    final week = [
      "月",
      "火",
      "水",
      "木",
      "金",
      "土",
      "日",
    ];
    final dateDifference = target.targetDate.difference(DateTime.now()).inDays;

    final startWeekDate =
        date.value.subtract(Duration(days: date.value.weekday - 1));
    final endWeekDate = date.value.add(Duration(days: 7 - date.value.weekday));

    return !target.isCompleted
        ? saving.when(
            data: (data) {
              final priceList = data
                  .where((e) => e.productId == target.docId)
                  .map((e) => e.price)
                  .toList();
              int sum;
              if (priceList.isEmpty) {
                sum = 0;
              } else {
                sum = priceList.reduce((a, b) => a + b);
              }
              final remainAmount = target.targetPrice - sum;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                date.value = date.value
                                    .subtract(const Duration(days: 7));
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
                                date.value =
                                    date.value.add(const Duration(days: 7));
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
                          future: savingCTL.culcWeeklyList(data, date),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const CircularProgressIndicator();
                            }
                            final doubleList = snapshot.data!;
                            return SizedBox(
                              height: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  7,
                                  (index) {
                                    double percent = doubleList[index] /
                                        (remainAmount / dateDifference);
                                    return GraphBar(
                                      weekText: week[index],
                                      percent: percent >= 1 ? 1 : percent,
                                      price: doubleList[index],
                                      barColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () {
              return const SizedBox();
            },
            error: (e, s) {
              return const SizedBox();
            },
          )
        : const SizedBox();
  }
}
