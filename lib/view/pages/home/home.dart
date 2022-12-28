import 'package:account_book_app/component/home/home_tile.dart';
import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/view/pages/home/additional_screen/target_add_member.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../theme/app_theme.dart';
import 'detail/details.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final target = ref.watch(targetControllerProvider);
    final saving = ref.watch(savingControllerProvider);
    final allUser = ref.watch(allUsersControllerProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      context.pushNamed(TargetAddMember.name);
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
                      margin: const EdgeInsets.only(bottom: 10),
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
                    ...List.generate(
                      target.length,
                      (index) {
                        return HomeTile(
                          state: target[index],
                          function: () {
                            context.pushNamed(
                              HomeDetails.name,
                              params: {
                                'docId': target[index].docId,
                              },
                            );
                          },
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
