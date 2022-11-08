import 'package:account_book_app/component/saving/add_buttom.dart';
import 'package:account_book_app/view/pages/saving/saving_history.dart';
import 'package:account_book_app/view/pages/saving/saving_init.dart';
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
import '../../../repository/friends_repository.dart';
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
    final selectedSaving = useState(0);
    final friendsListCTL = ref.watch(friendsListControllerProvider.notifier);
    final _controller = ConfettiController(duration: Duration(seconds: 1000));
    _controller.play();

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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              margin: const EdgeInsets.only(right: 10),
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
                                    fontWeight: index == selectedSaving.value
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
                        onTap: () {
                          Navigator.of(context).pushNamed(SavingInit.id);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                          savingState[selectedSaving.value].targetPrice;
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
                                  Navigator.of(context).pushNamed(
                                    SavingAdd.id,
                                    arguments:
                                        savingState[selectedSaving.value].id,
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
                              FutureBuilder(
                                  future: ref
                                      .watch(friendsListRepositoryProvider)
                                      .feachTargetsFriends(
                                          savingState[selectedSaving.value]
                                              .members),
                                  builder: (context, friend) {
                                    if (!friend.hasData) {
                                      return SizedBox();
                                    } else {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            top: 13, left: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(1, 1),
                                              color: Colors.grey,
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "メンバーリスト",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 88, 88, 88),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            ...List.generate(
                                              friend.data!.length,
                                              (index) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 65,
                                                        width: 65,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey,
                                                          shape:
                                                              BoxShape.circle,
                                                          image: friend
                                                                      .data![
                                                                          index]
                                                                      .img !=
                                                                  ""
                                                              ? DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    friend
                                                                        .data![
                                                                            index]
                                                                        .img,
                                                                  ),
                                                                )
                                                              : const DecorationImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: AssetImage(
                                                                      "assets/img/profile.png"),
                                                                ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            friend.data![index]
                                                                .name,
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          Text(
                                                            friend.data![index]
                                                                .email,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }),
                              const SizedBox(height: 80),
                            ],
                          ),
                          priceParsent >= 100
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: ConfettiWidget(
                                    confettiController: _controller,
                                  ),
                                )
                              : SizedBox(),
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
