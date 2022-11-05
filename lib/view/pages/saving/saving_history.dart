import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/saving/history_title.dart';
import '../../../provider/general_provider.dart';

class SavingHistory extends HookConsumerWidget {
  const SavingHistory({super.key});

  static const String id = "saving_history";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingState = ref.watch(savingControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("節約履歴"),
        centerTitle: true,
      ),
      // body: SafeArea(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: List.generate(
      //           savingState.length,
      //           (index) => HistoryTile(
      //             title: savingState[index].memo,
      //             date: savingState[index].registeTime,
      //             price: savingState[index].price,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
