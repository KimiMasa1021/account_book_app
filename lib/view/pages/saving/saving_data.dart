import 'package:account_book_app/component/saving/add_buttom.dart';
import 'package:account_book_app/component/saving/member_list_panel.dart';
import 'package:account_book_app/component/saving/secession_dialog.dart';
import 'package:account_book_app/component/saving/target_bar.dart';
import 'package:account_book_app/view/pages/saving/saving_history.dart';
import 'package:flutter/material.dart';
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
import 'package:confetti/confetti.dart';

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
    final size = MediaQuery.of(context).size;
    final savingState = ref.watch(savingControllerProvider);
    final selectedSaving = ref.watch(selectedSavingProvider);
    final controller =
        ConfettiController(duration: const Duration(seconds: 1000));
    controller.play();

    return SizedBox(
      height: size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const TargetBar(),
                StreamBuilder(
                  stream: ref.read(savingRepositoryProvider).feachList(
                        savingState[selectedSaving].id,
                      ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      final List<SavingState> state =
                          snapshot.data!.map((e) => e.data()).toList();
                      final savingPrice = state.isNotEmpty
                          ? state
                              .map((e) => e.price)
                              .toList()
                              .reduce((value, element) => value + element)
                          : 0;
                      final targetPrice =
                          savingState[selectedSaving].targetPrice;
                      final priceParsent = (savingPrice / targetPrice * 100);
                      final List<int> savingChartList = state.isNotEmpty
                          ? increaseRate(
                              state.map((e) => e.price).toList(),
                            )
                          : [];
                      return Stack(
                        children: [
                          Column(
                            children: [
                              TargetCard(
                                title: '目標',
                                subTitle: savingState[selectedSaving].target,
                              ),
                              DataCard(
                                  title: '目標金額',
                                  subTitle: NumberFormat("#,###").format(
                                      savingState[selectedSaving].targetPrice)),
                              AddButton(
                                title: "節約記録を追加",
                                function: () {
                                  Navigator.of(context).pushNamed(
                                    SavingAdd.id,
                                    arguments: savingState[selectedSaving].id,
                                  );
                                },
                              ),
                              DataCard(
                                title: '現在の節約総金額',
                                subTitle:
                                    NumberFormat("#,###").format(savingPrice),
                              ),
                              Row(
                                children: [
                                  AchieveRate(
                                    title: "達成率",
                                    parsent: priceParsent,
                                  ),
                                  HistoryButton(
                                    title: '履歴',
                                    fucntion: () {
                                      Navigator.of(context).pushNamed(
                                        SavingHistory.id,
                                        arguments: state,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              PriceChart(
                                savingChartList: savingChartList,
                              ),
                              const MemberListPanel(),
                              InkWell(
                                onTap: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const SecessionDialog();
                                    },
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: 13, left: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        color: Colors.grey,
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                  height: 60,
                                  width: double.infinity,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.logout_outlined,
                                        size: 35,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "メンバーから抜ける",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 80),
                            ],
                          ),
                          priceParsent >= 100
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: ConfettiWidget(
                                    confettiController: controller,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
