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
import '../../../model/saving_state.dart';
import '../../../provider/general_provider.dart';
import '../../../repository/saving_repository.dart';
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            savingState.length,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  selectedSaving.value = index;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: index == selectedSaving.value
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(200),
                                    border: Border.all(
                                      width: 3,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      savingState[index].groupName,
                                      style: TextStyle(
                                        color: index == selectedSaving.value
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight:
                                            index == selectedSaving.value
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.group_add_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: ref.read(savingRepositoryProvider).feachList(
                            savingState[selectedSaving.value].id,
                          ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          final List<SavingState> state =
                              snapshot.data!.map((e) => e.data()).toList();
                          return Column(
                            children: [
                              TargetCard(
                                title: '目標',
                                subTitle:
                                    savingState[selectedSaving.value].target,
                              ),
                              DataCard(
                                  title: '目標金額',
                                  subTitle: NumberFormat("#,###").format(
                                      savingState[selectedSaving.value]
                                          .targetPrice)),
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
                                      Navigator.of(context)
                                          .pushNamed(SavingHistory.id);
                                    },
                                  ),
                                ],
                              ),
                              PriceChart(
                                savingChartList: [], //savingChartList,
                              ),
                              const SizedBox(height: 80),
                            ],
                          );
                        }
                        // if (snapshot.connectionState == ConnectionState.done) {
                        //   if (snapshot.hasError) {
                        //     return SizedBox();
                        //   }
                        //   if (!snapshot.hasData) {
                        //     return Text("データが見つかりません");
                        //   }

                        // } else {
                        //   return Center(
                        //     child: const CircularProgressIndicator(),
                        //   );
                        // }
                      },
                    ),
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
