import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../application/providers/target_provider/provider/target_notifier_provider.dart';
import '../widgets/common/sticky_tab_bar_delegate.dart';
import '../widgets/list/tab_view_contents.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabHeight = 50.0;
    final size = MediaQuery.of(context).size;
    final profile = ref.watch(profileNotifierProvider);
    final target = ref.watch(targetNotifierProvider);

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: tabHeight,
                      width: size.width,
                      color: Theme.of(context).cardColor,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: CircleAvatar(
                                backgroundImage: profile.img != ""
                                    ? CachedNetworkImageProvider(profile.img)
                                    : null,
                                radius: 17.0,
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Lottie.asset(
                          //     LottieUrl.pig.url,
                          //     width: 50,
                          //     height: 50,
                          //     frameRate: FrameRate(60),
                          //     repeat: true,
                          //   ),
                          // ),
                        ],
                      ),
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
                        text: "期限切れ",
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
          body: target.when(
            data: (data) {
              final workingOnTarget = data
                  .where(
                    (e) =>
                        e.targetDate.difference(DateTime.now()).inDays > 0 &&
                        e.currentPercent < 1,
                  )
                  .toList();
              final overdueTarget = data
                  .where(
                    (e) =>
                        e.targetDate.difference(DateTime.now()).inDays <= 0 &&
                        e.currentPercent < 1,
                  )
                  .toList();
              final achievedTarget = data
                  .where(
                    (e) => e.currentPercent >= 1,
                  )
                  .toList();
              return Builder(
                builder: (context) {
                  return TabBarView(
                    children: [
                      TabViewContents(
                        targetList: workingOnTarget,
                      ),
                      TabViewContents(
                        targetList: overdueTarget,
                      ),
                      TabViewContents(
                        targetList: achievedTarget,
                      ),
                    ],
                  );
                },
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (error, stackTrace) {
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
