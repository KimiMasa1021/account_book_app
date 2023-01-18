import 'package:account_book_app/view/pages/home/home/home.dart';
import 'package:account_book_app/view/pages/setting/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/enums.dart';
import '../utility/hex_color.dart';
import '../provider/general_provider.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});
  static const String name = "root_page";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final authCTL = ref.watch(authControllerProvider);
    final List<Widget> pageList = <Widget>[
      const Home(),
      const Setting(),
    ];
    final pageState = ref.watch(pageTypeProvider);
    final tabItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.savings_outlined),
        activeIcon: Icon(Icons.savings),
        label: null,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: null,
      ),
    ];
    return Scaffold(
      backgroundColor: HexColor("#F5F5F5"),
      body: pageList[pageState.index],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageState.index,
        height: 60,
        backgroundColor: Colors.white,
        onTap: (index) {
          ref.watch(pageTypeProvider.notifier).state = PageType.values[index];
        },
        items: tabItems,
        border: const Border(),
        iconSize: 33,
        inactiveColor: Colors.black,
        activeColor: Colors.black,
      ),
    );
  }
}
