// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../component/auth/pink_background.dart';
// import '../../component/auth/sign_button.dart';
// import '../../constant/hex_color.dart';
// import 'package:sign_button/sign_button.dart';
// import '../../provider/general_provider.dart';

// class Sign extends HookConsumerWidget {
//   const Sign({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final ValueNotifier<bool> loading = useState(false);
//     final authController = ref.watch(authControllerProvider.notifier);
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: HexColor("FFF5E4"),
//           body: SizedBox(
//             height: size.height,
//             width: size.width,
//             child: Stack(
//               children: [
//                 const PinkBackGround(
//                   heightScale: 0.55,
//                 ),
//                 Align(
//                   alignment: const Alignment(0, 0),
//                   child: SafeArea(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 20),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: double.infinity,
//                               margin: const EdgeInsets.only(bottom: 20),
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(50),
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Padding(
//                                     padding: EdgeInsets.only(top: 40),
//                                     child: Text(
//                                       "認証方法を選択",
//                                       style: TextStyle(fontSize: 30),
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       SignButton(
//                                         type: ButtonType.google,
//                                         function: () async {
//                                           loading.value = true;
//                                           try {
//                                             await authController
//                                                 .signUpWithGoogle(loading);
//                                             loading.value = false;
//                                           } catch (e) {
//                                             debugPrint(e.toString());
//                                           }
//                                         },
//                                       ),
//                                       // SignButton(
//                                       //   type: ButtonType.apple,
//                                       //   function: () {},
//                                       // ),
//                                       // SignButton(
//                                       //   type: ButtonType.facebook,
//                                       //   function: () async {
//                                       //     loading.value = true;
//                                       //     try {
//                                       //       await authController
//                                       //           .signUpWithFaceBook(loading);
//                                       //       loading.value = false;
//                                       //     } catch (e) {
//                                       //       debugPrint(e.toString());
//                                       //     }
//                                       //   },
//                                       // ),
//                                       // SignButton(
//                                       //   type: ButtonType.yahoo,
//                                       //   function: () {},
//                                       // ),
//                                       const SizedBox(height: 20),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         loading.value
//             ? Align(
//                 child: Container(
//                   color: Colors.black.withOpacity(0.7),
//                   child: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }
