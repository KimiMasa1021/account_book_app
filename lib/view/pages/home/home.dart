import 'package:account_book_app/view/pages/home/tab_view/achieved.dart';
import 'package:account_book_app/view/pages/home/tab_view/overdue.dart';
import 'package:account_book_app/view/pages/home/tab_view/working_on.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100.0,
                floating: false,
                pinned: true,
                backgroundColor: Theme.of(context).cardColor,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                toolbarHeight: 50.0, //タブバーの高さ
                // centerTitle: true,
                elevation: 0.0,
                leadingWidth: 0.0,
                // bottom: TabBar(
                //   indicatorColor: Theme.of(context).colorScheme.onBackground,
                //   labelColor: Theme.of(context).colorScheme.onBackground,
                //   unselectedLabelColor:
                //       Theme.of(context).colorScheme.onBackground,
                //   tabs: const [
                //     Tab(text: "取り組み中"),
                //     Tab(text: "期限超過"),
                //     Tab(text: "達成済み"),
                //   ],
                // ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TabBar(
                        indicatorColor:
                            Theme.of(context).colorScheme.onBackground,
                        labelColor: Theme.of(context).colorScheme.onBackground,
                        unselectedLabelColor:
                            Theme.of(context).colorScheme.onBackground,
                        tabs: const [
                          Tab(text: "取り組み中"),
                          Tab(text: "期限超過"),
                          Tab(text: "達成済み"),
                        ],
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=632&h=354&fm=webp"), //NetworkImage
                                    radius: 16.0,
                                  ),
                                  Icon(
                                    Icons.flutter_dash_rounded,
                                    size: 35,
                                  ),
                                  SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TabBarView(
                    children: [
                      WorkingOn(),
                      Overdue(),
                      Achieved(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
