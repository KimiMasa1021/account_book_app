import 'package:account_book_app/component/home/home_tile.dart';
import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/route/routes.dart';
import '../../theme/app_theme.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final target = ref.watch(targetControllerProvider);
    final saving = ref.watch(savingControllerProvider);
    final allUser = ref.watch(allUsersControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              Container(
                height: 58,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "積み立てつもり貯金",
                      style: theme.textTheme.fs27,
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.name().addProjectMember);
                      },
                      child: const Icon(
                        Icons.group_add,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor("#FFEFEF"),
                          border: Border.all(
                            color: HexColor("#FF0000"),
                          ),
                        ),
                        child: const Center(
                          child: Text("広告"),
                        ),
                      ),
                      target.when(
                        data: (val) {
                          return Column(
                            children: [
                              ...List.generate(
                                val.length,
                                (index) {
                                  return HomeTile(
                                    state: val[index],
                                    function: () {
                                      context.pushNamed(
                                        Routes.name().projectDetails,
                                        params: {
                                          'docId': val[index].docId,
                                        },
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
      ),
    );
  }
}
