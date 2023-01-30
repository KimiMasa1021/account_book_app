import 'package:account_book_app/view/pages/home/tab_view/achieved.dart';
import 'package:account_book_app/view/pages/home/tab_view/overdue.dart';
import 'package:account_book_app/view/pages/home/tab_view/working_on.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(text: "取り組み中"),
                Tab(text: "期限超過"),
                Tab(text: "達成済み"),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  children: [
                    WorkingOn(),
                    Overdue(),
                    Achieved(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
