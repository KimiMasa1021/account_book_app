import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;

class AccountAppBar extends HookConsumerWidget {
  const AccountAppBar({
    super.key,
    required this.income,
    required this.expend,
    required this.setDate,
  });
  final int income;
  final int expend;
  final ValueNotifier<DateTime> setDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      width: double.infinity,
      // clipBehavior: Clip.antiAlias,\

      decoration: const BoxDecoration(
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
                  setDate.value =
                      DateTime(setDate.value.year, setDate.value.month - 1);
                },
                child: const Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
              ),
              Text(
                DateFormat('yyyy年MM月').format(setDate.value),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  setDate.value =
                      DateTime(setDate.value.year, setDate.value.month + 1);
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
