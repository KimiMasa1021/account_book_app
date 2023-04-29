// import 'package:account_book_app/provider/route/routes.dart';
// import 'package:account_book_app/view/component/lottie_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import '../../../../model/target/target_state.dart';
// import '../../../../utility/assets_url.dart';
// import '../../../../utility/format_text.dart';
// import '../../../theme/app_text_theme.dart';
// import 'widgets/drawer_info_panel.dart';
// import 'widgets/drawer_action_panel.dart';

// class MyDrawer extends ConsumerWidget {
//   const MyDrawer({super.key, required this.target});
//   final TargetState target;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final font = ref.watch(myTextTheme);

//     return SafeArea(
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           bottomLeft: Radius.circular(20),
//         ),
//         child: Container(
//           width: size.width * 0.9,
//           height: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.background,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 7, right: 5),
//                     child: CircleAvatar(
//                       backgroundColor: Theme.of(context).colorScheme.surface,
//                       radius: 35,
//                       foregroundImage:
//                           target.img != "" ? NetworkImage(target.img) : null,
//                       child: Text(
//                         target.target.substring(0, 2),
//                         style: font.fs19.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.onSurface,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${target.target} ",
//                           style: font.fs19.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           target.targetDescription,
//                           style: font.fs16,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               DrawerInfoPanel(
//                 title: "目標金額",
//                 content: RichText(
//                   text: TextSpan(
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     children: [
//                       TextSpan(
//                         text: FormatText.formatYen(target.targetPrice),
//                         style: font.fs27.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '円',
//                         style: font.fs16.copyWith(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 icon: Icons.crisis_alert_sharp,
//               ),
//               DrawerInfoPanel(
//                 title: "達成金額",
//                 content: RichText(
//                   text: TextSpan(
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     children: [
//                       TextSpan(
//                         text: FormatText.formatYen(target.currentPrice),
//                         style: font.fs27.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '円',
//                         style: font.fs16.copyWith(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 icon: Icons.stars,
//               ),
//               DrawerInfoPanel(
//                 title: '達成予定日',
//                 content: RichText(
//                   text: TextSpan(
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     children: [
//                       TextSpan(
//                         text: DateFormat('yyyy').format(target.targetDate),
//                         style: font.fs27.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '年',
//                         style: font.fs16.copyWith(),
//                       ),
//                       TextSpan(
//                         text: DateFormat('M').format(target.targetDate),
//                         style: font.fs27.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '月',
//                         style: font.fs16.copyWith(),
//                       ),
//                       TextSpan(
//                         text: DateFormat('d').format(target.targetDate),
//                         style: font.fs27.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '日',
//                         style: font.fs16.copyWith(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 icon: Icons.calendar_today,
//               ),
//               const SizedBox(height: 10),
//               DrawerActionPanel(
//                 title: "プロジェクトの編集",
//                 icon: Icons.settings,
//                 function: () {
//                   context.pushNamed(
//                     Routes.name().editProject,
//                     params: {'targetId': target.docId},
//                   );
//                 },
//               ),
//               DrawerActionPanel(
//                 title: "メンバー",
//                 icon: Icons.people_alt_outlined,
//                 function: () {
//                   context.pushNamed(
//                     Routes.name().memberList,
//                     extra: target,
//                   );
//                 },
//               ),
//               DrawerActionPanel(
//                 title: "招待",
//                 icon: Icons.person_add_sharp,
//                 function: () {
//                   context.pushNamed(
//                     Routes.name().inviteMember,
//                     params: {'targetId': target.docId},
//                   );
//                 },
//               ),
//               DrawerActionPanel(
//                 title: "退会",
//                 icon: Icons.logout,
//                 function: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => LottieDialog(
//                       url: LottieUrl.warning.url,
//                       title: '注意',
//                       subTitle: '退会した場合はフレンドに招待してもらわなければ再参加出来ません。',
//                       button1Title: '退会する',
//                       onTap1: () {
//                         context.go(Routes.path().root);
//                       },
//                       onTap2: () {
//                         context.pop();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
