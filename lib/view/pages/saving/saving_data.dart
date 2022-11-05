import 'package:account_book_app/component/saving/add_buttom.dart';
import 'package:account_book_app/view/pages/saving/saving_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import '../../../component/saving/achieve_rate.dart';
import '../../../component/saving/data_card.dart';
import '../../../component/saving/history_button.dart';
import '../../../component/saving/price_chart.dart';
import '../../../component/saving/target_card.dart';
import '../../../provider/general_provider.dart';
import 'saving_add.dart';

class SavingData extends HookConsumerWidget {
  const SavingData({super.key});
  List<int> increaseRate(List<int> list) {
    List<int> increaseRate = [];

    for (int x = 0; x < list.length; x++) {
      if (x == 0) {
        increaseRate.add(list[x]);
      } else {
        increaseRate.add(increaseRate[x - 1] + list[x]);
      }
    }

    return increaseRate;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;
    final savingState = ref.watch(savingControllerProvider);
    final selectedSaving = useState(0);

    // final savingPrice = savingState.isNotEmpty
    //     ? savingState
    //         .map((e) => e.price)
    //         .toList()
    //         .reduce((value, element) => value + element)
    //     : 0;
    // final targetPrice = usersState!.targetPrice;
    // final priceParsent = (savingPrice / targetPrice * 100).toStringAsFixed(1);
    // final List<int> savingChartList = savingState.isNotEmpty
    //     ? increaseRate(
    //         savingState.map((e) => e.price).toList(),
    //       )
    //     : [];

    return Stack(
      children: [
        SizedBox(
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(savingState.length, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 222, 222, 222),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Center(
                            child: Text(savingState[index].groupName),
                          ),
                        );
                      }),
                    ),

                    // InkWell(
                    //   onTap: () {},
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     child: Icon(
                    //       Icons.group_add_outlined,
                    //     ),
                    //   ),
                    // )
                    TargetCard(
                      title: '目標',
                      subTitle: savingState[selectedSaving.value].target,
                    ),
                    DataCard(
                      title: '目標金額',
                      subTitle: "かり",
                      //NumberFormat("#,###").format(targetPrice),
                    ),
                    AddButton(
                      title: "節約記録を追加",
                      function: () {
                        Navigator.of(context).pushNamed(SavingAdd.id);
                      },
                    ),
                    DataCard(
                      title: '現在の節約総金額',
                      subTitle: "かり",
                      //NumberFormat("#,###").format(savingPrice),
                    ),
                    Row(
                      children: [
                        AchieveRate(
                          title: "達成率",
                          parsent: "かり",
                          //priceParsent,
                        ),
                        HistoryButton(
                          title: '履歴',
                          fucntion: () {
                            Navigator.of(context).pushNamed(SavingHistory.id);
                          },
                        ),
                      ],
                    ),
                    PriceChart(
                      savingChartList: [], //savingChartList,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
