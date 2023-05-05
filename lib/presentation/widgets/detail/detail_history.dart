import 'package:account_book_app/application/providers/saving_provider/provider/saving_notifier_provider.dart';
import 'package:account_book_app/presentation/widgets/detail/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../../application/providers/target_provider/state/target_state.dart';

class DetailHistory extends ConsumerWidget {
  const DetailHistory({
    super.key,
    required this.state,
  });
  final TargetState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);
    final saving = ref.watch(savingNotifierProvider(state.productId));

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 10),
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
        ],
      ),
    );
  }
}
