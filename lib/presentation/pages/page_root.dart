import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../application/providers/go_router_provider/routes/routes.dart';

class PageRoot extends StatelessWidget {
  final Widget child;

  const PageRoot({
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
            icon: Icon(Icons.list),
            label: "プロジェクト",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: "統計",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "設定",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.list);
              break;
            case 1:
              context.go(Routes.statistic);
              break;
            case 2:
              context.go(Routes.setting);
              break;
          }
        },
      ),
    );
  }
}
