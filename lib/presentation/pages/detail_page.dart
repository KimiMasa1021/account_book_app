import 'package:account_book_app/presentation/widgets/detail/detail_history.dart';
import 'package:account_book_app/presentation/widgets/detail/detail_home.dart';
import 'package:account_book_app/presentation/widgets/detail/detail_member.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../provider/route/routes.dart';
import '../../application/providers/target_provider/state/target_state.dart';
import '../../view/pages/home/widgets/sticky_tab_bar_delegate.dart';
import '../../view/theme/app_text_theme.dart';
import '../widgets/list/tab_view_contents.dart';

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
    final tabHeight = size.height / 3;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
        body: SafeArea(
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
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
                            width: size.width,
                            decoration: BoxDecoration(
                              image: target.imageUrl != ""
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(target.imageUrl),
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            child: InkWell(
                              onTap: () {
                                debugPrint("unk");
                              },
                              child: Container(
                                width: size.width - 30,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Center(
                                  child: Text(
                                    "節約記録を追加！",
                                    style: font.fs16.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
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
                      indicatorColor:
                          Theme.of(context).colorScheme.onBackground,
                      labelColor: Theme.of(context).colorScheme.onBackground,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onBackground,
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
                    const DetailHome(),
                    DetailHistory(),
                    DetailMember(
                      memberList: target.members,
                    ),
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
// child: CustomScrollView(
//   clipBehavior: Clip.none,
//   slivers: <Widget>[
//     SliverAppBar(
//       expandedHeight: size.height * 0.4,
//       automaticallyImplyLeading: false,
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.delete,
//             color: Colors.black.withOpacity(0),
//           ),
//         )
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         background: Container(
//           height: size.height * 0.4,
//           width: size.width,
//           color: Theme.of(context).colorScheme.background,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: size.height * 0.37,
//                 width: size.width,
//                 child: PageView(
//                   controller: pageController,
//                   children: [
//                     // PageViewLeft(target: target),
//                     // PageViewCenter(target: target),
//                     // PageViewRight(target: target),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     // SliverList(
//     //   delegate: targetMembers.when(
//     //     data: (data) {
//     //       return saving.when(
//     //         data: (data) {
//     //           //日付別のリスト
//     //           final dailySavingList = data.map((e) {
//     //             final eDate = e.createdAt;
//     //             return data
//     //                 .map((a) {
//     //                   final aDate = a.createdAt;
//     //                   if (DateTime(
//     //                         eDate.year,
//     //                         eDate.month,
//     //                         eDate.day,
//     //                       ) ==
//     //                       DateTime(
//     //                         aDate.year,
//     //                         aDate.month,
//     //                         aDate.day,
//     //                       )) {
//     //                     return a;
//     //                   }
//     //                 })
//     //                 .whereType<SavingState>()
//     //                 .toList();
//     //           }).toList();
//     //           //
//     //           return SliverChildBuilderDelegate(
//     //             childCount: dailySavingList.isEmpty
//     //                 ? 1
//     //                 : dailySavingList.length,
//     //             (context, index) {
//     //               if (dailySavingList.isEmpty) {
//     //                 return SavingAddButton(
//     //                   function: () {
//     //                     context.goNamed(
//     //                       Routes.name().addSaving,
//     //                       extra: target,
//     //                     );
//     //                   },
//     //                 );
//     //               } else if (index == 0) {
//     //                 return Column(
//     //                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                   children: [
//     //                     SavingAddButton(
//     //                       function: () {
//     //                         context.pushNamed(
//     //                           Routes.name().addSaving,
//     //                           extra: target,
//     //                         );
//     //                       },
//     //                     ),
//     //                     Padding(
//     //                       padding: const EdgeInsets.symmetric(
//     //                           horizontal: 15),
//     //                       child: RichText(
//     //                         text: TextSpan(
//     //                           style: Theme.of(context)
//     //                               .textTheme
//     //                               .bodyMedium,
//     //                           children: [
//     //                             TextSpan(
//     //                               text: DateFormat('yyyy').format(
//     //                                   dailySavingList[index][0]
//     //                                       .createdAt),
//     //                               style: font.fs21.copyWith(
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                             TextSpan(
//     //                               text: '年',
//     //                               style: font.fs16.copyWith(),
//     //                             ),
//     //                             TextSpan(
//     //                               text: DateFormat('M').format(
//     //                                   dailySavingList[index][0]
//     //                                       .createdAt),
//     //                               style: font.fs21.copyWith(
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                             TextSpan(
//     //                               text: '月',
//     //                               style: font.fs16.copyWith(),
//     //                             ),
//     //                           ],
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     SavingPanel(
//     //                       state: dailySavingList[index],
//     //                       target: target,
//     //                     ),
//     //                   ],
//     //                 );
//     //               } else {
//     //                 final today = dailySavingList[index][0].createdAt;
//     //                 final yesterday =
//     //                     dailySavingList[index - 1][0].createdAt;
//     //                 if (DateTime(today.year, today.month, today.day) !=
//     //                     DateTime(yesterday.year, yesterday.month,
//     //                         yesterday.day)) {
//     //                   return Column(
//     //                     crossAxisAlignment: CrossAxisAlignment.start,
//     //                     children: [
//     //                       today.year != yesterday.year ||
//     //                               today.month != yesterday.month
//     //                           ? Padding(
//     //                               padding: const EdgeInsets.symmetric(
//     //                                   horizontal: 15),
//     //                               child: RichText(
//     //                                 text: TextSpan(
//     //                                   style: Theme.of(context)
//     //                                       .textTheme
//     //                                       .bodyMedium,
//     //                                   children: [
//     //                                     TextSpan(
//     //                                       text: DateFormat('yyyy')
//     //                                           .format(
//     //                                               dailySavingList[index]
//     //                                                       [0]
//     //                                                   .createdAt),
//     //                                       style: font.fs21.copyWith(
//     //                                         fontWeight: FontWeight.bold,
//     //                                       ),
//     //                                     ),
//     //                                     TextSpan(
//     //                                       text: '年',
//     //                                       style: font.fs16.copyWith(),
//     //                                     ),
//     //                                     TextSpan(
//     //                                       text: DateFormat('M').format(
//     //                                           dailySavingList[index][0]
//     //                                               .createdAt),
//     //                                       style: font.fs21.copyWith(
//     //                                         fontWeight: FontWeight.bold,
//     //                                       ),
//     //                                     ),
//     //                                     TextSpan(
//     //                                       text: '月',
//     //                                       style: font.fs16.copyWith(),
//     //                                     ),
//     //                                   ],
//     //                                 ),
//     //                               ),
//     //                             )
//     //                           : const SizedBox(),
//     //                       SavingPanel(
//     //                         state: dailySavingList[index],
//     //                         target: target,
//     //                       ),
//     //                       index == dailySavingList.length - 1
//     //                           ? const SizedBox(height: 50)
//     //                           : const SizedBox()
//     //                     ],
//     //                   );
//     //                 } else {
//     //                   return SizedBox(
//     //                     height: index == dailySavingList.length - 1
//     //                         ? 50
//     //                         : 0,
//     //                   );
//     //                 }
//     //               }
//     //             },
//     //           );
//     //         },
//     //         loading: () {
//     //           return SliverChildBuilderDelegate(
//     //             childCount: 0,
//     //             (_, int index) {
//     //               return null;
//     //             },
//     //           );
//     //         },
//     //         error: (e, s) {
//     //           return SliverChildBuilderDelegate(
//     //             childCount: 0,
//     //             (_, int index) {
//     //               return null;
//     //             },
//     //           );
//     //         },
//     //       );
//     //     },
//     //     error: (e, s) {
//     //       return SliverChildBuilderDelegate(
//     //         childCount: 0,
//     //         (_, int index) {
//     //           return null;
//     //         },
//     //       );
//     //     },
//     //     loading: () {
//     //       return SliverChildBuilderDelegate(
//     //         childCount: 0,
//     //         (_, int index) {
//     //           return null;
//     //         },
//     //       );
//     //     },
//     //   ),
//     // ),
//   ],
// ),
