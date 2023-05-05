import 'package:account_book_app/presentation/widgets/detail/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';

class DetailHistory extends ConsumerWidget {
  const DetailHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
          HistoryPanel(profile: profile),
        ],
      ),
    );
  }
}
