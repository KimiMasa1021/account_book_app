import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user/users_state.dart';
import '../repository/users_repository.dart';

final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState?>(
        (ref) => UsersController(ref));

class UsersController extends StateNotifier<UsersState> {
  final Ref ref;
  Map<String, dynamic>? data;

  UsersController(this.ref) : super(UsersState()) {
    ref
        .read(usersRepositoryProvider)
        .feachGenreList()
        .listen((data) => state = data!);
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

  final picker = ImagePicker();
  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile == null) {
      return null;
    }
    final croppedFile = await cropImage(pickedFile.path);
    if (croppedFile == null) {
      return null;
    }
    return File(croppedFile.path);
  }

  Future<File?> cropImage(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 80,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '画像の位置選択',
          toolbarColor: const Color.fromARGB(255, 255, 0, 0),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          hideBottomControls: true,
          showCropGrid: false,
        ),
      ],
    );
    if (croppedFile == null) return null;

    return File(croppedFile.path);
  }

  Future<void> editProfile(
    File? image,
    String newUserName,
  ) async {
    String? imageUrl;
    if (image != null) {
      imageUrl = await ref.read(usersRepositoryProvider).uploadImage(image);
    }

    await ref.read(usersRepositoryProvider).editProfile(imageUrl, newUserName);
  }
}
