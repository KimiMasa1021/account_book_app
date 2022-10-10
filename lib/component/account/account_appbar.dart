import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

import '../../provider/general_provider.dart';

class AccountAppBar extends HookConsumerWidget {
  const AccountAppBar({
    super.key,
    required this.income,
    required this.expend,
  });
  final int income;
  final int expend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateState = ref.watch(setDateProvider);
    final dateController = ref.watch(setDateProvider.notifier);

    return Container(
      height: 100,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  dateController.state =
                      DateTime(dateState.year, dateState.month - 1);
                },
                child: const Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
              ),
              Text(
                DateFormat('yyyy年MM月').format(dateState),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  dateController.state =
                      DateTime(dateState.year, dateState.month + 1);
                },
                child: const Icon(
                  Icons.arrow_right,
                  size: 50,
                ),
              ),
            ],
          ),
          const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 24),
            tabs: <Widget>[
              Tab(text: '収入'),
              Tab(text: '支出'),
            ],
          ),
        ],
      ),
    );
  }
}
