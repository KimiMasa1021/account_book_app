// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../../../model/user/users_state.dart';

// class MemberTIle extends HookConsumerWidget {
//   const MemberTIle({
//     super.key,
//     required this.usersState,
//     required this.newMembers,
//   });
//   final UsersState usersState;
//   final ValueNotifier<List<String>> newMembers;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectFlg = useState(false);

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         children: [
//           Container(
//             width: 55,
//             height: 55,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   usersState.img,
//                 ),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   offset: const Offset(0, 0),
//                   blurRadius: 4,
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               usersState.name,
//               // style: theme.textTheme.fs19,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Checkbox(
//             value: selectFlg.value,
//             onChanged: (val) {
//               selectFlg.value = val!;
//               if (val) {
//                 newMembers.value = List.of(newMembers.value)
//                   ..add(usersState.uid);
//               } else {
//                 newMembers.value = List.of(newMembers.value)
//                   ..remove(usersState.uid);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
