import 'package:account_book_app/constant/enums.dart';
import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/view/pages/setting/setting.dart';
import 'package:account_book_app/view/pages/statistic/statistic.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/general_provider.dart';

class RootPage extends HookConsumerWidget {
  RootPage({super.key});
  static const String id = "root_page";

  final List<Widget> _pageList = <Widget>[
    const Statistic(),
    const Setting(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageTypeProvider);
    final tabItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.stacked_bar_chart),
        label: '統計',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '設定',
      ),
    ];
    return Scaffold(
      backgroundColor: HexColor("F5F5F5"),
      body: _pageList[pageState.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageState.index,
        onTap: (index) {
          ref.watch(pageTypeProvider.notifier).state = PageType.values[index];
        },
        items: tabItems,
        iconSize: 38,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        elevation: 2,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
