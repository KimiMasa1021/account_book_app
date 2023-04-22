import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../application/providers/go_router_provider/routes/routes.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers_sharp),
            label: "うんこ1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "うんこ2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "うんこ3",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.test1);
              break;
            case 1:
              context.go(Routes.test2);
              break;
            case 2:
              context.go(Routes.test3);
              break;
          }
        },
      ),
    );
  }
}
