import 'package:account_book_app/view/pages/home/detail/page_view_left.dart';
import 'package:account_book_app/view/pages/home/detail/page_view_right.dart';
import 'package:account_book_app/view/pages/home/detail/saving_add.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../component/home/home_details_tile.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';
import 'my_drawer.dart';
import 'page_view_center.dart';

class HomeDetails extends HookConsumerWidget {
  const HomeDetails({
    super.key,
    required this.docId,
  });
  static String name = "home_details";
  final String docId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = ref.watch(appThemeProvider);
    final saving = ref.watch(savingControllerProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final allUser = ref.watch(allUsersControllerProvider);

    final target = ref
        .watch(targetControllerProvider)
        .singleWhere((e) => e.docId == docId);
    final savingList =
        saving.where((e) => e.productId == target.docId).toList();

    final pageController = PageController(
      viewportFraction: 0.9,
      initialPage: 1,
    );
    final scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
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
        actionsIconTheme: const IconThemeData(color: Colors.black),
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
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: size.height * 0.4,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 17),
                      SizedBox(
                        height: size.height * 0.35,
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
              delegate: SliverChildBuilderDelegate(
                childCount: savingList.isEmpty ? 1 : savingList.length,
                (_, int index) {
                  return savingList.isEmpty
                      ? InkWell(
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
                                  "貯金する！！(つもり)",
                                  style: theme.textTheme.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : index != 0
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_box_outlined,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "貯金する！！(つもり)",
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
                                      .singleWhere((e) =>
                                          e.uid == savingList[index].userId)
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
