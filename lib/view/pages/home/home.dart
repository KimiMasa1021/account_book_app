// import 'package:account_book_app/utility/assets_url.dart';
// import 'package:account_book_app/view/pages/home/widgets/tab_view_contents.dart';
// import 'package:account_book_app/view/pages/home/widgets/sticky_tab_bar_delegate.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lottie/lottie.dart';
// import '../../../view_model/target_controller.dart';
// import '../../../view_model/users_controller.dart';

// class Home extends HookConsumerWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     const tabHeight = 50.0;
//     final size = MediaQuery.of(context).size;
//     final userState = ref.watch(usersControllerProvider);
//     // final target = ref.watch(targetControllerProvider);

//     return DefaultTabController(
//       length: 3,
//       child: SafeArea(
//         child: NestedScrollView(
//           headerSliverBuilder:
//               (BuildContext context, bool innnerBoxIsScrolled) {
//             return <Widget>[
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     Container(
//                       height: tabHeight,
//                       width: size.width,
//                       color: Theme.of(context).cardColor,
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 15,
//                               ),
//                               child: CircleAvatar(
//                                 backgroundImage: userState?.img != ""
//                                     ? CachedNetworkImageProvider(userState!.img)
//                                     : null,
//                                 radius: 17.0,
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: Lottie.asset(
//                               LottieUrl.pig.url,
//                               width: 50,
//                               height: 50,
//                               frameRate: FrameRate(60),
//                               repeat: true,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate: StickyTabBarDelegate(
//                   backgroundColor: Theme.of(context).cardColor,
//                   tabBar: TabBar(
//                     indicatorColor: Theme.of(context).colorScheme.onBackground,
//                     labelColor: Theme.of(context).colorScheme.onBackground,
//                     unselectedLabelColor:
//                         Theme.of(context).colorScheme.onBackground,
//                     tabs: const [
//                       Tab(
//                         text: "取り組み中",
//                         height: tabHeight,
//                       ),
//                       Tab(
//                         text: "期限切れ",
//                         height: tabHeight,
//                       ),
//                       Tab(
//                         text: "達成済み",
//                         height: tabHeight,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: target.when(
//             data: (data) {
//               final workingOnTarget = data
//                   .where(
//                     (e) =>
//                         e.targetDate.difference(DateTime.now()).inDays > 0 &&
//                         !e.isCompleted,
//                   )
//                   .toList();
//               final overdueTarget = data
//                   .where(
//                     (e) =>
//                         e.targetDate.difference(DateTime.now()).inDays <= 0 &&
//                         !e.isCompleted,
//                   )
//                   .toList();
//               final achievedTarget = data
//                   .where(
//                     (e) => e.isCompleted,
//                   )
//                   .toList();
//               return Builder(
//                 builder: (context) {
//                   return TabBarView(
//                     children: [
//                       TabViewContents(
//                         targetList: workingOnTarget,
//                       ),
//                       TabViewContents(
//                         targetList: overdueTarget,
//                       ),
//                       TabViewContents(
//                         targetList: achievedTarget,
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             loading: () {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//             error: (error, stackTrace) {
//               return const SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
