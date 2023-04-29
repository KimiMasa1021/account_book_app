// import 'package:account_book_app/view/component/my_lottie_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../../model/enums.dart';
// import '../../../../view_model/friend_controller.dart';
// import '../../../../view_model/target_controller.dart';
// import 'widgets/member_tile.dart';
// import '../../../component/lottie_loading.dart';

// class InviteMember extends HookConsumerWidget {
//   const InviteMember({
//     super.key,
//     required this.docId,
//   });
//   final String docId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final friends = ref.watch(friendsControllerProvider);
//     final target = ref.watch(targetControllerProvider);
//     final ValueNotifier<List<String>> newMembers = useState([]);
//     final flg = useState(TargetInitFlg.inputing);
//     final targetCTL = ref.watch(targetControllerProvider.notifier);

//     return target.when(
//       data: (data) {
//         final target = data.singleWhere((e) => e.docId == docId);
//         final uninvitedMember = friends
//             .where(
//               (e) => !target.members.contains(e.uid),
//             )
//             .toList();
//         return Stack(
//           children: [
//             Scaffold(
//               appBar: AppBar(
//                 title: const Text("招待"),
//                 actions: [
//                   IconButton(
//                     onPressed: () async {
//                       if (newMembers.value.isNotEmpty) {
//                         flg.value = TargetInitFlg.creating;
//                         await targetCTL.updateMember(
//                           target.members,
//                           newMembers.value,
//                           docId,
//                         );
//                         await Future.delayed(const Duration(seconds: 3));
//                         flg.value = TargetInitFlg.complete;
//                       }
//                     },
//                     padding: const EdgeInsets.only(right: 10),
//                     icon: const Text("追加"),
//                   ),
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: ListView.builder(
//                     itemCount: uninvitedMember.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return MemberTIle(
//                         usersState: uninvitedMember[index],
//                         newMembers: newMembers,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             LottieLoading(
//               flg: flg.value,
//               lottieData: MyLottieData.inviteMember(),
//               resultFunction: () {
//                 context.pop();
//               },
//             )
//           ],
//         );
//       },
//       error: (e, s) {
//         return const SizedBox();
//       },
//       loading: () {
//         return const SizedBox();
//       },
//     );
//   }
// }
