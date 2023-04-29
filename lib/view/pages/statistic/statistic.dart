// import 'dart:math';

// import 'package:account_book_app/view/pages/statistic/widget/info_panel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../model/saving/saving_state.dart';
// import '../../../utility/format_text.dart';
// import '../../../view_model/all_saving_controller.dart';
// import '../../theme/app_text_theme.dart';
// import 'widget/bar.dart';
// import 'widget/tag_panel.dart';

// class Statistic extends HookConsumerWidget {
//   const Statistic({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final font = ref.watch(myTextTheme);
//     final allSaving = ref.watch(allSavingControllerProvider);
//     final tagFlg = useState(false);
//     return SingleChildScrollView(
//       child: allSaving.when(
//         data: (data) {
//           final taglist = [];

//           //合計金額
//           final sum = data.isEmpty
//               ? 0
//               : data.map((e) => e.price).reduce((v, e) => v + e);
//           //節約回数
//           final savedTimes = data.length;
//           //タグ別のリスト
//           final listByTag = data.map((e) {
//             if (taglist.contains(e.memo)) {
//               return [];
//             }
//             final list = data.where((f) => f.memo == e.memo).toList();
//             taglist.add(e.memo);
//             return list;
//           }).toList();
//           listByTag.removeWhere((e) => e.isEmpty);
//           listByTag.sort((a, b) {
//             final aSum = a.map((e) => e.price).reduce((v, e) => v + e);
//             final bSum = b.map((e) => e.price).reduce((v, e) => v + e);
//             return bSum.compareTo(aSum);
//           });
//           //曜日別のリスト
//           final List<List<SavingState>> listByWeek = [];
//           for (int i = 1; i < 8; i++) {
//             listByWeek
//                 .add(data.where((e) => e.createdAt.weekday == i).toList());
//           }
//           //曜日別の金額リスト
//           final priceListByWeek = listByWeek.map((e) {
//             if (e.isEmpty) {
//               return 0;
//             } else {
//               return e.map((a) => a.price).reduce((v, s) => v + s);
//             }
//           }).toList();
//           //曜日別最高金額
//           final maxPriceWeekly = priceListByWeek.reduce(max);

//           return SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "あなたの統計",
//                     style: font.fs21.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   InfoPanel(
//                     icon: Icons.savings_outlined,
//                     title: '節約合計金額',
//                     text: FormatText.formatYen(sum),
//                     unit: "円",
//                   ),
//                   InfoPanel(
//                     icon: Icons.heart_broken_sharp,
//                     title: 'これまでの節約回数',
//                     text: savedTimes.toString(),
//                     unit: "回",
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "タグ別の金額",
//                     style: font.fs16.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   ...List.generate(
//                     tagFlg.value
//                         ? listByTag.length
//                         : listByTag.length >= 3
//                             ? listByTag.getRange(0, 3).length
//                             : listByTag.length,
//                     (index) {
//                       return TagPanel(
//                         text: listByTag[index][0].memo,
//                         state: listByTag[index] as List<SavingState>,
//                         total: sum,
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 5),
//                   InkWell(
//                     onTap: () {
//                       tagFlg.value = !tagFlg.value;
//                     },
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           !tagFlg.value ? "すべてみる" : "とじる",
//                           style: font.fs16.copyWith(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "曜日別の傾向",
//                     style: font.fs16.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: AspectRatio(
//                       aspectRatio: 1.7 / 1,
//                       child: SizedBox(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: List.generate(
//                             7,
//                             (index) => Bar(
//                               percent: priceListByWeek[index] == 0
//                                   ? 0
//                                   : (priceListByWeek[index] / maxPriceWeekly),
//                               index: index,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           );
//         },
//         loading: () {
//           return null;
//         },
//         error: (e, s) {
//           return null;
//         },
//       ),
//     );
//   }
// }
