import 'package:account_book_app/application/providers/saving_provider/provider/saving_notifier_provider.dart';
import 'package:account_book_app/presentation/widgets/detail/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/target_provider/state/target_state.dart';
import 'history_date.dart';

class DetailHistory extends ConsumerWidget {
  const DetailHistory({
    super.key,
    required this.state,
  });
  final TargetState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saving = ref.watch(savingNotifierProvider(state.productId));

    return saving.when(
      data: (data) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ...List.generate(
                  data.length,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HistoyDate(
                          today: data[index],
                          previous: index == 0 ? null : data[index - 1],
                        ),
                        HistoryPanel(
                          savingState: data[index],
                          targetState: state,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const Text("エラー");
      },
      error: (e, s) {
        return const SizedBox();
      },
    );
  }
}
