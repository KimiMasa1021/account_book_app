import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../model/target/target_init.dart';
import '../model/target/target_state.dart';
import '../model/user/users_state.dart';
import '../repository/target_init_repository.dart';
import '../repository/users_repository.dart';
import 'auth_controller.dart';

final targetInitControllerProvider = StateNotifierProvider.autoDispose
    .family<TargetInitCntroller, TargetInit, TargetState?>(
        (ref, target) => TargetInitCntroller(ref, target: target));

class TargetInitCntroller extends StateNotifier<TargetInit> {
  final Ref ref;
  String? userId;
  final TargetState? target;

  TargetInitCntroller(this.ref, {this.target})
      : super(
          TargetInit(),
        ) {
    userId = ref.read(authControllerProvider)!.uid;

    if (target == null) {
      state = state.copyWith(
        targetController: TextEditingController(text: ""),
        targetPriceController: TextEditingController(text: ""),
        targetDescriptionController: TextEditingController(text: ""),
      );
    } else {
      state = state.copyWith(
        targetController: TextEditingController(text: target!.target),
        targetPriceController:
            TextEditingController(text: target!.targetPrice.toString()),
        targetDescriptionController:
            TextEditingController(text: target!.targetDescription),
        targetDateController: target!.registeTime,
      );
    }
  }
  final picker = ImagePicker();
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile == null) {
      return;
    }
    final croppedFile = await cropImage(pickedFile.path);
    if (croppedFile == null) {
      return;
    }
    state = state.copyWith(
      file: File(croppedFile.path),
    );
  }

  Future<File?> cropImage(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: CropStyle.rectangle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 80,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '画像の位置選択',
          toolbarColor: const Color.fromARGB(255, 255, 0, 0),
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
          hideBottomControls: true,
          showCropGrid: false,
        ),
      ],
    );
    if (croppedFile == null) return null;

    return File(croppedFile.path);
  }

  void addMember(UsersState usersState) {
    state = state.copyWith(
      selectedUserList: List.of(state.selectedUserList)..add(usersState),
    );
  }

  void removeMember(UsersState usersState) {
    state = state.copyWith(
      selectedUserList: List.of(state.selectedUserList)..remove(usersState),
    );
  }

  void removeImage() {
    state = state.copyWith(
      file: null,
    );
  }

  final DateTime _now = DateTime.now();

  Future<void> pickTargetDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _now,
      firstDate: _now,
      lastDate: DateTime(2050),
    );

    if (picked == null) return;

    state = state.copyWith(
      targetDateController: picked,
    );
  }

  Future<void> createNewTarget() async {
    final url = state.file != null
        ? await ref.read(usersRepositoryProvider).uploadImage(state.file!)
        : "";
    final members = state.selectedUserList.map((e) => e.uid).toList();
    final price =
        int.parse(state.targetPriceController!.text.replaceAll(",", ""));

    final targetState = TargetState(
      target: state.targetController!.text,
      targetPrice: price,
      targetDescription: state.targetDescriptionController!.text,
      registeTime: DateTime.now(),
      targetDate: state.targetDateController!,
      members: [...members, userId!],
      img: url,
    );
    await ref.read(targetInitRepositoryProvider).createTarget(targetState);
  }

  bool checkDetails() {
    if (state.targetController!.text == "" ||
        state.targetPriceController!.text == "" ||
        state.targetDescriptionController!.text == "" ||
        state.targetDateController == null) {
      shwoToast("すべて必須項目です");
      return false;
    }
    if (state.targetController!.text.length <= 2) {
      shwoToast("目標は３文字以上設定しよう！");
      return false;
    }
    // if (state.targetPriceController!.text.length ) {
    //   shwoToast("目標金額は0円以上にしよう!");
    //   return false;
    // }
    return true;
  }

  void shwoToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }

  Future<void> updateTarget(TargetState target, String docId) async {
    final url = state.file != null
        ? await ref.read(usersRepositoryProvider).uploadImage(state.file!)
        : target.img;
    final price =
        int.parse(state.targetPriceController!.text.replaceAll(",", ""));

    final targetState = TargetState(
      target: state.targetController!.text,
      targetPrice: price,
      targetDescription: state.targetDescriptionController!.text,
      registeTime: target.registeTime,
      targetDate: state.targetDateController!,
      members: target.members,
      img: url,
      docId: target.docId,
      totalSaving: target.totalSaving,
    );
    await ref
        .read(targetInitRepositoryProvider)
        .updateTarget(targetState, docId);
  }

  Future<void> updateMember(
    List<String> preMembers,
    List<String> newMembers,
    String docId,
  ) async {
    final member = [...preMembers, ...newMembers];
    await ref.read(targetInitRepositoryProvider).updateMember(member, docId);
  }
}
