import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/general_provider.dart';
import '../provider/route/routes.dart';

class ScaffoldWithNavBar extends HookConsumerWidget {
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final authCTL = ref.watch(authControllerProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith(Routes.path().home)) {
      return 0;
    }
    if (location.startsWith(Routes.path().setting)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.path().home);
        break;
      case 1:
        GoRouter.of(context).go(Routes.path().setting);
        break;
    }
  }
}
