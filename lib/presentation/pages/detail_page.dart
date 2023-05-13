import 'package:account_book_app/presentation/widgets/detail/tab_view/detail_history.dart';
import 'package:account_book_app/presentation/widgets/detail/tab_view/detail_home.dart';
import 'package:account_book_app/presentation/widgets/detail/tab_view/detail_member.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/target_provider/state/target_state.dart';
import '../../common/theme/app_text_theme.dart';
import '../widgets/common/sticky_tab_bar_delegate.dart';
import '../widgets/detail/detail_header.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({
    super.key,
    required this.target,
  });
  final TargetState target;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(target.target),
          actionsIconTheme: const IconThemeData(),
        ),
        body: SafeArea(
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innnerBoxIsScrolled) {
              return <Widget>[
                DetailHeader(target: target),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    backgroundColor: Theme.of(context).cardColor,
                    tabBar: TabBar(
                      indicatorColor:
                          Theme.of(context).colorScheme.onBackground,
                      labelColor: Theme.of(context).colorScheme.onBackground,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onBackground,
                      labelStyle: font.fs16,
                      tabs: const [
                        Tab(text: "ホーム"),
                        Tab(text: "履歴"),
                        Tab(text: "メンバー"),
                        Tab(text: "概要"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Builder(
              builder: (context) {
                return TabBarView(
                  children: [
                    DetailHome(targetState: target),
                    DetailHistory(state: target),
                    DetailMember(targetState: target),
                    Container(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
