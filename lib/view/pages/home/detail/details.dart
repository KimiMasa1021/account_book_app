import 'package:account_book_app/model/target/target_state.dart';
import 'package:account_book_app/view/pages/home/detail/panels/page_view_left.dart';
import 'package:account_book_app/view/pages/home/detail/panels/page_view_right.dart';
import 'package:account_book_app/view_model/target_members_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../component/panel/saving_panel.dart';
import '../../../theme/app_text_theme.dart';
import 'drawers/drawer.dart';
import 'panels/page_view_center.dart';

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
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final targetMembers =
        ref.watch(targetMembersControllerProvider(target.members));
    final font = ref.watch(myTextTheme);

    final pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 1,
    );
    final savingList =
        saving.where((e) => e.productId == target.docId).toList();
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
              elevation: 0,
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
                            const PageViewRight(),
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
                    childCount: savingList.length,
                    (_, int index) {
                      // // savingListが空の場合
                      // if (savingList.isEmpty) {
                      //   return SavingAddButton(
                      //     function: () {
                      //       context.pushNamed(
                      //         Routes.name().addSaving,
                      //         params: {'targetId': target.docId},
                      //       );
                      //     },
                      //   );
                      // }

                      // final iDate = savingList[index].createdAt;
                      // final backDate = savingList[index - 1].createdAt;

                      // //上記以外の場合
                      // return Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SavingPanel(
                      //       price: savingList[index].price,
                      //       member: data
                      //           .singleWhere(
                      //               (e) => e.uid == savingList[index].userId)
                      //           .name,
                      //       memo: savingList[index].memo,
                      //     ),
                      //   ],
                      // );
                      final test = savingList
                          .where((e) =>
                              e.createdAt
                                  .difference(savingList[index].createdAt)
                                  .inDays ==
                              0)
                          .toList();
                      if (index == 0) {
                        return SavingPanel(
                          state: test,
                          target: target,
                        );
                      }
                      if (savingList[index - 1]
                              .createdAt
                              .difference(savingList[index].createdAt)
                              .inDays ==
                          0) {
                        return SizedBox();
                      }
                      return SavingPanel(
                        state: test,
                        target: target,
                      );
                    },
                  );
                },
                error: (e, s) {
                  return SliverChildBuilderDelegate(
                    childCount: 0,
                    (_, int index) {},
                  );
                },
                loading: () {
                  return SliverChildBuilderDelegate(
                    childCount: 0,
                    (_, int index) {},
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
