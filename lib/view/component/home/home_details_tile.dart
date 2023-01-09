import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';

class HomeDetailsTile extends HookConsumerWidget {
  const HomeDetailsTile({
    super.key,
    required this.price,
    required this.member,
    required this.memo,
  });
  final int price;
  final String member;
  final String memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                savingCTL.formatYen(price),
                style: theme.textTheme.fs27.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(
                    member,
                    style: theme.textTheme.fs16,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(memo, style: theme.textTheme.fs16)
        ],
      ),
    );
  }
}
