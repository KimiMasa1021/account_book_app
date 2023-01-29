import 'package:account_book_app/view/pages/home/widgets/target_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/route/routes.dart';
import '../../../view_model/target_controller.dart';
import 'widgets/add_target_panel.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final target = ref.watch(targetControllerProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    target.when(
                      data: (val) {
                        return Column(
                          children: [
                            ...List.generate(
                              val.length,
                              (index) {
                                return TargetPanel(
                                  state: val[index],
                                  function: () {
                                    context.pushNamed(
                                      Routes.name().projectDetails,
                                      extra: val[index],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
