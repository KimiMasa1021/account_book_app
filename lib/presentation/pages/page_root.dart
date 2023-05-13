import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/go_router_provider/routes/routes.dart';
import '../widgets/common/custom_nav_bar.dart';

class PageRoot extends HookConsumerWidget {
  final Widget child;

  const PageRoot({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar(
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.list);
              currentIndex.value = index;
              break;
            case 1:
              context.go(Routes.statistic);
              currentIndex.value = index;
              break;
            case 2:
              context.go(Routes.setting);
              currentIndex.value = index;
              break;
          }
        },
        currentIndex: currentIndex.value,
        backgroundColor: Theme.of(context).cardColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
        ],
      ),
    );
  }
}
