import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/saving/history_title.dart';
import '../../../model/saving_state.dart';
import '../../../provider/general_provider.dart';
import '../../../repository/friends_repository.dart';

class SavingHistory extends HookConsumerWidget {
  const SavingHistory({super.key});

  static const String id = "saving_history";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ModalRoute.of(context)!.settings.arguments as List<SavingState>;
    final savingState = ref.watch(savingControllerProvider);
    final selectedSaving = ref.watch(selectedSavingProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        title: const Text("節約履歴"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ref
            .watch(friendsListRepositoryProvider)
            .feachTargetsFriends(savingState[selectedSaving].members),
        builder: (context, friend) {
          if (!friend.hasData) {
            return const SizedBox();
          } else {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      state.length,
                      (index) => HistoryTile(
                        title: state[index].memo,
                        date: state[index].registeTime,
                        price: state[index].price,
                        name: friend.data!
                            .singleWhere((e) => e.uid == state[index].member)
                            .name,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
