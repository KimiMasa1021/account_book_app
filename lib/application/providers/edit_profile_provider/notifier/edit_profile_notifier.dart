import 'dart:io';
import 'package:account_book_app/application/providers/edit_profile_provider/state/edit_profile.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:account_book_app/application/services/storege_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileNotifier extends StateNotifier<EditProfile> {
  EditProfileNotifier(
    this.ref,
    this.profile, {
    required ProfileService profileService,
    required StorageService storageService,
  })  : _profileService = profileService,
        _storageService = storageService,
        super(const EditProfile()) {
    state = state.copyWith(newName: profile.name);
  }
  final Ref ref;
  final Profile profile;
  final ProfileService _profileService;
  final StorageService _storageService;
  void onChanged(String val) {
    state = state.copyWith(newName: val);
  }

  Future<void> showEditProfileImageSheet(
    BuildContext context,
    Function() closeSheet,
  ) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.image_outlined),
              title: const Text("ギャラリーから選ぶ"),
              onTap: () async {
                await getImage(ImageSource.gallery);
                closeSheet();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("写真を撮る"),
              onTap: () async {
                await getImage(ImageSource.camera);
                closeSheet();
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined),
              title: const Text("キャンセル"),
              onTap: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void closeSheet(BuildContext context) {
    context.pop();
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
      newImageFile: File(croppedFile.path),
    );
  }

  Future<File?> cropImage(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 80,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '画像の切り取り',
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

  Future<void> editProfile(Function() navPop) async {
    if (state.newName.isEmpty) return;
    state = state.copyWith(isLoading: true);
    String url = "";
    if (state.newImageFile != null) {
      final result = await _storageService.uploadImage(state.newImageFile!);
      url = result.asValue!.value;
    }
    await _profileService.editProfile(
      state.newName,
      url == "" ? profile.img : url,
    );
    navPop();
  }
}
