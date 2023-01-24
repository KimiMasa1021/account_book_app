import 'package:account_book_app/view/pages/home/widgets/target_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/route/routes.dart';
import '../../../view_model/target_controller.dart';

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
            SizedBox(
              height: 58,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.name().addProjectMember);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.group_add,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 10, top: 10),
                    //   height: 60,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: HexColor("#FFEFEF"),
                    //     border: Border.all(
                    //       color: HexColor("#FF0000"),
                    //     ),
                    //   ),
                    //   child: const Center(
                    //     child: Text("広告"),
                    //   ),
                    // ),
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
                            const SizedBox(height: 10),
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
