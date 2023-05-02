// import 'package:account_book_app/provider/route/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../../../../../view_model/friend_controller.dart';
// import '../../../../../view_model/search_users_controller.dart';
// import '../../../../../view_model/users_controller.dart';
// import '../../../../theme/app_text_theme.dart';

// // ignore: must_be_immutable
// class QrCamera extends ConsumerWidget {
//   QrCamera({
//     super.key,
//     required this.loading,
//     required this.flg,
//   });
//   QRViewController? controller;
//   final ValueNotifier<bool> loading;
//   final ValueNotifier<bool> flg;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//     final friendCTL = ref.watch(friendsControllerProvider.notifier);
//     final searchUsesr = ref.watch(searchUsersControllerProvider(null).notifier);
//     final size = MediaQuery.of(context).size;
//     final font = ref.watch(myTextTheme);
//     final usersState = ref.watch(usersControllerProvider);

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: (controller) async {
//                 this.controller = controller;
//                 controller.pauseCamera();
//                 controller.resumeCamera();
//                 controller.scannedDataStream.listen(
//                   (scanData) async {
//                     loading.value = true;

//                     final friendState =
//                         await searchUsesr.searchUser(scanData.code.toString());
//                     if (scanData.code.toString() == usersState!.uid) {
//                       friendCTL.shwoToast("自分自身を登録することはできません");
//                     } else if (friendState != null && context.mounted) {
//                       context.pushNamed(
//                         Routes.name().userProfile,
//                         extra: friendState,
//                       );
//                     } else {
//                       friendCTL.shwoToast("ユーザーが見つかりませんでした");
//                     }
//                     loading.value = false;
//                   },
//                 );
//               },
//               overlay: QrScannerOverlayShape(
//                 borderColor: Theme.of(context).colorScheme.secondary,
//                 overlayColor: Theme.of(context).colorScheme.surface,
//                 borderRadius: 10,
//                 borderLength: 30,
//                 borderWidth: 10,
//                 cutOutSize: size.width / 2,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.camera_alt_outlined,
//                     color: Theme.of(context).colorScheme.onSurface,
//                     size: 60,
//                   ),
//                   Text(
//                     "スキャン",
//                     style: font.fs16.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.onSurface,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () async {
//               flg.value = !flg.value;
//             },
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                 ),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 7),
//                       child: Icon(
//                         Icons.qr_code,
//                         color: Theme.of(context).colorScheme.onSecondary,
//                       ),
//                     ),
//                     Text(
//                       "マイQRコード",
//                       style: font.fs16.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).colorScheme.onSecondary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
