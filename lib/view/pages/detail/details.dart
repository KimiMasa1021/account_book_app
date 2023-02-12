import 'package:account_book_app/model/saving/saving_state.dart';
import 'package:account_book_app/model/target/target_state.dart';
import 'package:account_book_app/view/pages/detail/widgets/panels/page_view_left.dart';
import 'package:account_book_app/view/pages/detail/widgets/panels/page_view_right.dart';
import 'package:account_book_app/view_model/search_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../provider/route/routes.dart';
import '../../../view_model/saving_controller.dart';
import '../../theme/app_text_theme.dart';
import 'widgets/saving_add_button.dart';
import 'widgets/saving_panel.dart';
import 'drawer/drawer.dart';
import 'widgets/panels/page_view_center.dart';

class HomeDetails extends HookConsumerWidget {
  const HomeDetails({
    super.key,
    required this.target,
  });
  final TargetState target;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final saving = ref.watch(savingControllerProvider);
    final targetMembers =
        ref.watch(searchUsersControllerProvider(target.members));
    final pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 1,
    );
    final font = ref.watch(myTextTheme);
    final savingList =
        saving.where((e) => e.productId == target.docId).toList();
    final dailySavingList = savingList.map((e) {
      final eDate = e.createdAt;
      return savingList
          .map((a) {
            final aDate = a.createdAt;
            if (DateTime(
                  eDate.year,
                  eDate.month,
                  eDate.day,
                ) ==
                DateTime(
                  aDate.year,
                  aDate.month,
                  aDate.day,
                )) {
              return a;
            }
          })
          .whereType<SavingState>()
          .toList();
    }).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(target.target),
        actionsIconTheme: const IconThemeData(),
      ),
      endDrawer: MyDrawer(
        target: target,
      ),
      body: SafeArea(
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.4,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black.withOpacity(0),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: size.height * 0.4,
                  width: size.width,
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.37,
                        width: size.width,
                        child: PageView(
                          controller: pageController,
                          children: [
                            PageViewLeft(target: target),
                            PageViewCenter(target: target),
                            PageViewRight(target: target),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: targetMembers.when(
                data: (data) {
                  return SliverChildBuilderDelegate(
                    childCount:
                        dailySavingList.isEmpty ? 1 : dailySavingList.length,
                    (context, index) {
                      if (dailySavingList.isEmpty) {
                        return SavingAddButton(
                          function: () {
                            context.goNamed(
                              Routes.name().addSaving,
                              extra: target,
                            );
                          },
                        );
                      } else if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SavingAddButton(
                              function: () {
                                context.pushNamed(
                                  Routes.name().addSaving,
                                  extra: target,
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: [
                                    TextSpan(
                                      text: DateFormat('yyyy').format(
                                          dailySavingList[index][0].createdAt),
                                      style: font.fs21.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '年',
                                      style: font.fs16.copyWith(),
                                    ),
                                    TextSpan(
                                      text: DateFormat('M').format(
                                          dailySavingList[index][0].createdAt),
                                      style: font.fs21.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '月',
                                      style: font.fs16.copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SavingPanel(
                              state: dailySavingList[index],
                              target: target,
                            ),
                          ],
                        );
                      } else {
                        final today = dailySavingList[index][0].createdAt;
                        final yesterday =
                            dailySavingList[index - 1][0].createdAt;
                        if (DateTime(today.year, today.month, today.day) !=
                            DateTime(yesterday.year, yesterday.month,
                                yesterday.day)) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              today.year != yesterday.year ||
                                      today.month != yesterday.month
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: RichText(
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          children: [
                                            TextSpan(
                                              text: DateFormat('yyyy').format(
                                                  dailySavingList[index][0]
                                                      .createdAt),
                                              style: font.fs21.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '年',
                                              style: font.fs16.copyWith(),
                                            ),
                                            TextSpan(
                                              text: DateFormat('M').format(
                                                  dailySavingList[index][0]
                                                      .createdAt),
                                              style: font.fs21.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '月',
                                              style: font.fs16.copyWith(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              SavingPanel(
                                state: dailySavingList[index],
                                target: target,
                              ),
                              index == dailySavingList.length - 1
                                  ? const SizedBox(height: 50)
                                  : const SizedBox()
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                    },
                  );
                },
                error: (e, s) {
                  return SliverChildBuilderDelegate(
                    childCount: 0,
                    (_, int index) {
                      return null;
                    },
                  );
                },
                loading: () {
                  return SliverChildBuilderDelegate(
                    childCount: 0,
                    (_, int index) {
                      return null;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
