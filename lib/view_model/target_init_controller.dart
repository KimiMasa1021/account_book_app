// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import '../model/target/target_init.dart';
// import '../model/target/target_state.dart';
// import '../model/user/users_state.dart';
// import '../repository/target_init_repository.dart';
// import '../repository/users_repository.dart';
// import 'auth_controller.dart';

// final targetInitControllerProvider = StateNotifierProvider.autoDispose
//     .family<TargetInitCntroller, TargetInit, TargetState?>(
//         (ref, target) => TargetInitCntroller(ref, target: target));

// class TargetInitCntroller extends StateNotifier<TargetInit> {
//   final Ref ref;
//   String? userId;
//   final TargetState? target;

//   TargetInitCntroller(this.ref, {this.target})
//       : super(
//           TargetInit(),
//         ) {
//     userId = ref.read(authControllerProvider)!.uid;

//     if (target == null) {
//       state = state.copyWith(
//         targetController: TextEditingController(text: ""),
//         targetPriceController: TextEditingController(text: ""),
//         targetDescriptionController: TextEditingController(text: ""),
//       );
//     } else {
//       state = state.copyWith(
//         targetController: TextEditingController(text: target!.target),
//         targetPriceController:
//             TextEditingController(text: target!.targetPrice.toString()),
//         targetDescriptionController:
//             TextEditingController(text: target!.targetDescription),
//         targetDateController: target!.targetDate,
//       );
//     }
//   }



//   void addMember(UsersState usersState) {
//     state = state.copyWith(
//       selectedUserList: List.of(state.selectedUserList)..add(usersState),
//     );
//   }

//   void removeMember(UsersState usersState) {
//     state = state.copyWith(
//       selectedUserList: List.of(state.selectedUserList)..remove(usersState),
//     );
//   }

//   void removeImage() {
//     state = state.copyWith(
//       file: null,
//     );
//   }

//   final DateTime _now = DateTime.now();

//   Future<void> pickTargetDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _now,
//       firstDate: _now,
//       lastDate: DateTime(2050),
//     );

//     if (picked == null) return;

//     state = state.copyWith(
//       targetDateController: picked,
//     );
//   }

//   Future<void> createNewTarget() async {
//     final url = state.file != null
//         ? await ref.read(usersRepositoryProvider).uploadImage(state.file!)
//         : "";
//     final members = state.selectedUserList.map((e) => e.uid).toList();
//     final price =
//         int.parse(state.targetPriceController!.text.replaceAll(",", ""));

//     final targetState = TargetState(
//       target: state.targetController!.text,
//       targetPrice: price,
//       targetDescription: state.targetDescriptionController!.text,
//       registeTime: DateTime.now(),
//       targetDate: state.targetDateController!,
//       members: [...members, userId!],
//       img: url,
//     );
//     await ref.read(targetInitRepositoryProvider).createTarget(targetState);
//   }

//   bool checkDetails() {
//     if (state.targetController!.text == "" ||
//         state.targetPriceController!.text == "" ||
//         state.targetDescriptionController!.text == "" ||
//         state.targetDateController == null) {
//       shwoToast("すべて必須項目です");
//       return false;
//     }
//     if (state.targetController!.text.length <= 2) {
//       shwoToast("目標は３文字以上設定しよう！");
//       return false;
//     }
//     return true;
//   }

//   void shwoToast(String msg) {
//     Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       textColor: const Color.fromARGB(255, 255, 255, 255),
//       fontSize: 16.0,
//     );
//   }

//   Future<void> updateTarget(TargetState target, String docId) async {
//     final url = state.file != null
//         ? await ref.read(usersRepositoryProvider).uploadImage(state.file!)
//         : target.img;
//     final price =
//         int.parse(state.targetPriceController!.text.replaceAll(",", ""));

//     final targetState = TargetState(
//       target: state.targetController!.text,
//       targetPrice: price,
//       targetDescription: state.targetDescriptionController!.text,
//       registeTime: target.registeTime,
//       targetDate: state.targetDateController!,
//       members: target.members,
//       img: url,
//       docId: target.docId,
//     );
//     await ref
//         .read(targetInitRepositoryProvider)
//         .updateTarget(targetState, docId);
//   }
// }
