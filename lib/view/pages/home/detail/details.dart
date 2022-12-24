import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/view/pages/home/detail/page_view_left.dart';
import 'package:account_book_app/view/pages/home/detail/page_view_right.dart';
import 'package:account_book_app/view/pages/home/detail/saving_add.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../component/home/custom_painter.dart';
import '../../../../component/home/home_details_tile.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';
import 'page_view_center.dart';

class HomeDetails extends HookConsumerWidget {
  const HomeDetails({
    super.key,
    required this.docId,
    required this.sum,
  });
  static String name = "home_details";
  final String docId;
  final int sum;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = ref.watch(appThemeProvider);
    final saving = ref.watch(savingControllerProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final allUser = ref.watch(allUsersControllerProvider);

    final pageController = PageController(
      viewportFraction: 0.9,
      initialPage: 1,
    );
    final target = ref
        .watch(targetControllerProvider)
        .singleWhere((e) => e.docId == docId);
    final percent = sum / target.targetPrice;
    final savingList =
        saving.where((e) => e.productId == target.docId).toList();

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
        title: Text(target.target),
        titleTextStyle: theme.textTheme.fs19.copyWith(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 230,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 230,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        width: size.width,
                        child: PageView(
                          controller: pageController,
                          children: [
                            const PageViewLeft(),
                            PageViewCenter(
                              target: target,
                              percent: percent,
                              sum: sum,
                            ),
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
                childCount: savingList.length,
                (_, int index) {
                  return index != 0
                      ? HomeDetailsTile(
                          price: savingList[index].price,
                          member: allUser
                              .singleWhere(
                                  (e) => e.uid == savingList[index].userId)
                              .name,
                          memo: savingList[index].memo,
                        )
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pushNamed(
                                  SavingAdd.name,
                                  params: {'docId': target.docId},
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
                                      "追加する！！",
                                      style: theme.textTheme.fs19.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            HomeDetailsTile(
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
  }
}
