import 'package:account_book_app/presentation/widgets/list/create_target_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/go_router_provider/routes/routes.dart';

class TabViewContents extends ConsumerWidget {
  const TabViewContents({
    super.key,
    // required this.targetList,
  });
  // final List<TargetState> targetList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Column(
              children: [
                // ...List.generate(
                //   targetList.length,
                //   (index) {
                //     return TargetPanel(
                //       state: targetList[index],
                //       function: () {
                //         context.pushNamed(
                //           Routes.name().projectDetails,
                //           extra: targetList[index],
                //         );
                //       },
                //     );
                //   },
                // ),
              ],
            ),
            CreateTargetPanel(
              onTap: () {
                context.go(Routes.createTarget);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
