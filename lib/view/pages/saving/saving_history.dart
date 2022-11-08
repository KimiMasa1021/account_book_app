import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/saving/history_title.dart';
import '../../../model/saving_state.dart';

class SavingHistory extends HookConsumerWidget {
  const SavingHistory({super.key});

  static const String id = "saving_history";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ModalRoute.of(context)!.settings.arguments as List<SavingState>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("節約履歴"),
        centerTitle: true,
      ),
      body: SafeArea(
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
