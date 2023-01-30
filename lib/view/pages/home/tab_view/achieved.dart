import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/route/routes.dart';
import '../../../../view_model/target_controller.dart';
import '../widgets/add_target_panel.dart';
import '../widgets/target_panel.dart';

class Achieved extends ConsumerWidget {
  const Achieved({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final target = ref.watch(targetControllerProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          target.when(
            data: (val) {
              final workingOnTarget = val
                  .where(
                    (e) => e.registeTime.isAfter(DateTime.now()),
                  )
                  .toList();

              return Column(
                children: [
                  ...List.generate(
                    workingOnTarget.length,
                    (index) {
                      return TargetPanel(
                        state: workingOnTarget[index],
                        function: () {
                          context.pushNamed(
                            Routes.name().projectDetails,
                            extra: workingOnTarget[index],
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
            error: (e, s) {
              return const SizedBox();
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          AddTargetPanel(
            onTap: () {
              context.pushNamed(Routes.name().addProjectMember);
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
