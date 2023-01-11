import 'dart:io';
import 'package:account_book_app/model/target_init.dart';
import 'package:account_book_app/model/target_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../model/users_state.dart';
import '../provider/general_provider.dart';
import '../repository/target_init_repository.dart';
import '../repository/users_repository.dart';

class TargetInitCntroller extends StateNotifier<TargetInit> {
  final Ref ref;
  String? userId;

  TargetInitCntroller(this.ref)
      : super(
          TargetInit(),
        ) {
    userId = ref.read(authControllerProvider)!.uid;

    state = state.copyWith(
      targetController: TextEditingController(text: ""),
      targetPriceController: TextEditingController(text: ""),
      targetDescriptionController: TextEditingController(text: ""),
    );
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

  Future<void> createNewTarget(Function() function) async {
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
    function();
  }

  bool checkDetails() {
    if (state.targetController!.text == "" ||
        state.targetPriceController!.text == "" ||
        state.targetDescriptionController!.text == "" ||
        state.targetDateController == null) {
      shwoToast("すべて必須項目です");
      return false;
    }
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
}
