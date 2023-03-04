import 'package:account_book_app/model/target/target_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/route/routes.dart';
import 'add_target_panel.dart';
import 'target_panel.dart';

class TabViewContents extends ConsumerWidget {
  const TabViewContents({
    super.key,
    required this.targetList,
  });
  final List<TargetState> targetList;

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
                ...List.generate(
                  targetList.length,
                  (index) {
                    return TargetPanel(
                      state: targetList[index],
                      function: () {
                        context.pushNamed(
                          Routes.name().projectDetails,
                          extra: targetList[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            AddTargetPanel(
              onTap: () {
                context.pushNamed(Routes.name().addProjectMember);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
