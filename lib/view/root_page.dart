import 'package:account_book_app/view/pages/home/home/home.dart';
import 'package:account_book_app/view/pages/setting/setting.dart';
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
    final List<Widget> _pageList = <Widget>[
      const Home(),
      const Setting(),
    ];
    final pageState = ref.watch(pageTypeProvider);
    final tabItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.savings_outlined),
        label: 'home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'setting',
      ),
    ];
    return Scaffold(
      backgroundColor: HexColor("#F5F5F5"),
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
