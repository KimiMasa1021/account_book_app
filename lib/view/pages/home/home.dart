import 'package:account_book_app/view/pages/home/tab_view/achieved.dart';
import 'package:account_book_app/view/pages/home/tab_view/overdue.dart';
import 'package:account_book_app/view/pages/home/tab_view/working_on.dart';
import 'package:account_book_app/view/pages/home/widgets/sticky_tab_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabHeight = 60.0;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          height: tabHeight,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=632&h=354&fm=webp"), //NetworkImage
                                radius: 16.0,
                              ),
                              SizedBox()
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.flutter_dash_rounded,
                            size: 35,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  backgroundColor: Theme.of(context).cardColor,
                  tabBar: TabBar(
                    indicatorColor: Theme.of(context).colorScheme.onBackground,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onBackground,
                    tabs: const [
                      Tab(
                        text: "取り組み中",
                        height: tabHeight,
                      ),
                      Tab(
                        text: "期限超過",
                        height: tabHeight,
                      ),
                      Tab(
                        text: "達成済み",
                        height: tabHeight,
                      ),
                    ],
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
