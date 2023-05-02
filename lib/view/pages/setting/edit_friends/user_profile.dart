// import 'package:account_book_app/model/user/users_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../../view_model/users_controller.dart';
// import '../../../theme/app_text_theme.dart';
// import '../../../../../view_model/friend_controller.dart';

// class UserProfile extends HookConsumerWidget {
//   const UserProfile({
//     super.key,
//     required this.friendState,
//   });
//   final UsersState friendState;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final font = ref.watch(myTextTheme);
//     final friendCTL = ref.watch(friendsControllerProvider.notifier);
//     final loading = useState(false);
//     final userState = ref.watch(usersControllerProvider);

//     final isFriend =
//         userState!.friends.contains(friendState.uid) ? true : false;

//     return Stack(
//       children: [
//         Scaffold(
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () {
//                             context.pop();
//                           },
//                           icon: const Icon(
//                             Icons.close,
//                             size: 30,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: 90,
//                       height: 90,
//                       margin: const EdgeInsets.only(
//                         top: 20,
//                         bottom: 10,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.onBackground,
//                         borderRadius: BorderRadius.circular(10),
//                         image: friendState.img != ""
//                             ? DecorationImage(
//                                 image: NetworkImage(
//                                   friendState.img,
//                                 ),
//                               )
//                             : null,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                             offset: const Offset(0, 0),
//                             blurRadius: 6,
//                           )
//                         ],
//                       ),
//                     ),
//                     Text(
//                       friendState.name,
//                       style: font.fs21.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Spacer(),
//                     InkWell(
//                       onTap: () async {
//                         if (isFriend) return;
//                         loading.value = true;
//                         await friendCTL.qrFriendRequest(friendState.uid);
//                         loading.value = false;
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(
//                           vertical: 20,
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 12,
//                         ),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Theme.of(context).colorScheme.secondary,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 7),
//                               child: Icon(
//                                 Icons.person_add,
//                                 color:
//                                     Theme.of(context).colorScheme.onSecondary,
//                               ),
//                             ),
//                             Text(
//                               isFriend ? "登録済み" : "フレンド追加",
//                               style: font.fs16.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color:
//                                     Theme.of(context).colorScheme.onSecondary,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         loading.value
//             ? Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }
