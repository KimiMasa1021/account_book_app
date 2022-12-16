// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../provider/general_provider.dart';

// class SecessionDialog extends HookConsumerWidget {
//   const SecessionDialog({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final selectedSaving = ref.watch(selectedSavingProvider);
//     final selectedSavingCTL = ref.watch(selectedSavingProvider.notifier);
//     final savingState = ref.watch(savingControllerProvider);
//     final savingCTL = ref.watch(savingControllerProvider.notifier);

//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: Container(
//         height: size.height / 2,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             const Text(
//               "メンバーから抜けますか？\n",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             const Text(
//               "※再度加入するためにはフレンドに招待してもらわなければなりません\n",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () async {
//                 selectedSavingCTL.state = 0;
//                 await savingCTL.seceesion(
//                   savingState[selectedSaving].id,
//                   savingState[selectedSaving].members,
//                   () => Navigator.pop(context),
//                 );
//               },
//               child: Container(
//                 height: 60,
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(width: 3, color: Colors.black),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "脱退",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             InkWell(
//               onTap: () async {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 60,
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "キャンセル",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// //