import 'package:account_book_app/view/component/detail/graph_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../model/target/target_state.dart';
import '../../../../../utility/hex_color.dart';
import '../../../../../provider/general_provider.dart';

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
        color: HexColor("#FFB0B0"),
        borderRadius: BorderRadius.circular(0),
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
                      child: Icon(
                        Icons.arrow_circle_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "${DateFormat('MM月dd日').format(startWeekDate)}から${DateFormat('MM月dd日').format(endWeekDate)}",
                    // style: theme.textTheme.fs16.copyWith(
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.white,
                    // ),
                  ),
                  InkWell(
                    onTap: () {
                      date.value = date.value.add(const Duration(days: 7));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_circle_right,
                        size: 30,
                        color: Colors.white,
                      ),
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
                            textCol0r: index == 5
                                ? HexColor("#70D4F7")
                                : index == 6
                                    ? Colors.red.withOpacity(0.8)
                                    : Colors.white,
                            price: doubleList[index],
                            barColor: HexColor("#70D4F7"),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              "１日当たり${dailyPrice}円で達成できます!!",
              // style: theme.textTheme.fs16.copyWith(
              //   fontWeight: FontWeight.bold,
              //   color: Colors.white,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
