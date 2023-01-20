import 'package:account_book_app/view/pages/home/home/home.dart';
import 'package:account_book_app/view/pages/setting/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/enums.dart';
import '../view_model/auth_controller.dart';
import '../view_model/users_controller.dart';

final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.home);

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
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
      ),
    ];
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: pageList[pageState.index],
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageState.index,
          height: 60,
          onTap: (index) {
            ref.watch(pageTypeProvider.notifier).state = PageType.values[index];
          },
          items: tabItems,
          border: const Border(),
          iconSize: 33,
        ),
      ),
    );
  }
}
