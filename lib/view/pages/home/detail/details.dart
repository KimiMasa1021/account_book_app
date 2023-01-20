import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/pages/home/detail/panels/page_view_left.dart';
import 'package:account_book_app/view/pages/home/detail/panels/page_view_right.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/panel/saving_panel.dart';
import '../../../../provider/general_provider.dart';
import 'drawers/drawer.dart';
import 'panels/page_view_center.dart';

class HomeDetails extends HookConsumerWidget {
  const HomeDetails({
    super.key,
    required this.docId,
  });
  final String docId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final saving = ref.watch(savingControllerProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final allUser = ref.watch(allUsersControllerProvider);
    final target = ref.watch(targetControllerProvider);

    final pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 1,
    );
    return target.when(
      data: (target) {
        final nowTarget = target.singleWhere((e) => e.docId == docId);
        final savingList =
            saving.where((e) => e.productId == nowTarget.docId).toList();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            title: Text(nowTarget.target),
            // titleTextStyle: theme.textTheme.fs19.copyWith(
            //   color: Colors.black,
            // ),
            actionsIconTheme: const IconThemeData(color: Colors.black),
          ),
          endDrawer: MyDrawer(
            target: nowTarget,
          ),
          body: SafeArea(
            child: CustomScrollView(
              clipBehavior: Clip.none,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: size.height * 0.4,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.37,
                            width: size.width,
                            child: PageView(
                              controller: pageController,
                              children: [
                                PageViewLeft(target: nowTarget),
                                PageViewCenter(target: nowTarget),
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
                  delegate: SliverChildBuilderDelegate(
                    childCount: savingList.isEmpty ? 1 : savingList.length,
                    (_, int index) {
                      // savingListが空の場合
                      if (savingList.isEmpty) {
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              Routes.name().addSaving,
                              params: {'targetId': nowTarget.docId},
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 174, 103),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "貯金する！！(つもり)",
                                  // style: theme.textTheme.fs19.copyWith(
                                  //   fontWeight: FontWeight.bold,
                                  //   color: Colors.white,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      // indexが0の場合
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                context.pushNamed(
                                  Routes.name().addSaving,
                                  params: {'targetId': nowTarget.docId},
                                );
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 174, 103),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add_box_outlined,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "貯金する！！(つもり)",
                                      // style: theme.textTheme.fs19.copyWith(
                                      //   fontWeight: FontWeight.bold,
                                      //   color: Colors.white,
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                savingCTL
                                    .formatDate(savingList[index].createdAt),
                                // style: theme.textTheme.fs16.copyWith(
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                            ),
                            SavingPanel(
                              price: savingList[index].price,
                              member: allUser
                                  .singleWhere(
                                      (e) => e.uid == savingList[index].userId)
                                  .name,
                              memo: savingList[index].memo,
                            ),
                          ],
                        );
                      }
                      final iDate = savingList[index].createdAt;
                      final backDate = savingList[index - 1].createdAt;

                      //上記以外の場合
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DateTime(
                                    iDate.year,
                                    iDate.month,
                                    iDate.day,
                                  ) !=
                                  DateTime(
                                    backDate.year,
                                    backDate.month,
                                    backDate.day,
                                  )
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    savingCTL.formatDate(
                                        savingList[index].createdAt),
                                    // style: theme.textTheme.fs16.copyWith(
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                )
                              : const SizedBox(),
                          SavingPanel(
                            price: savingList[index].price,
                            member: allUser
                                .singleWhere(
                                    (e) => e.uid == savingList[index].userId)
                                .name,
                            memo: savingList[index].memo,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const SizedBox();
      },
      error: (e, s) {
        return const SizedBox();
      },
    );
  }
}
