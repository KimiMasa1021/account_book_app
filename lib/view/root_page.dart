import 'package:account_book_app/view/component/custom_nav_bar.dart';
import 'package:account_book_app/view/pages/home/animated_appbar.dart';
import 'package:account_book_app/view/pages/home/home.dart';
import 'package:account_book_app/view/pages/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/enums.dart';
import '../view_model/auth_controller.dart';
import '../view_model/users_controller.dart';

final pageTypeProvider =
    StateProvider.autoDispose<PageType>((ref) => PageType.home);

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);
    ref.watch(usersControllerProvider);

    final List<Widget> pageList = <Widget>[
      const Home(),
      const Setting(),
    ];
    final pageState = ref.watch(pageTypeProvider);
    const iconSize = 33.0;
    final tabItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.savings_outlined, size: iconSize),
        activeIcon: Icon(Icons.savings, size: iconSize),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined, size: iconSize),
        activeIcon: Icon(Icons.settings, size: iconSize),
      ),
    ];
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: pageList[pageState.index],
        bottomNavigationBar: CustomNavBar(
          backgroundColor: Theme.of(context).cardColor,
          items: tabItems,
          currentIndex: pageState.index,
          onTap: (index) {
            ref.watch(pageTypeProvider.notifier).state = PageType.values[index];
          },
        ),
      ),
    );
  }
}
