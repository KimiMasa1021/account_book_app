import 'dart:io';

import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/application/services/storege_service.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateTargetNotifier extends StateNotifier<CreateTargetState> {
  CreateTargetNotifier({
    required targetService,
    required this.ref,
    required storageService,
  })  : _targetService = targetService,
        _storageService = storageService,
        super(CreateTargetState.initial());

  final TargetService _targetService;
  final StorageService _storageService;
  final Ref ref;

  void onStepContinue() {
    int x = state.stepperIndex;
    if (x >= 0 && x < 3) {
      state = state.copyWith(stepperIndex: x += 1);
    }
  }

  void onStepCancel() {
    int x = state.stepperIndex;
    if (x > 0) {
      state = state.copyWith(stepperIndex: x -= 1);
    }
  }

  void setMember(Profile profile) {
    final flg = state.members.map((e) => e.uid).contains(profile.uid);

    if (flg) {
      List<Profile> newList = List.from(state.members);
      newList.remove(profile);
      state = state.copyWith(
        members: [...newList],
      );
    } else {
      state = state.copyWith(
        members: [...state.members, profile],
      );
    }
  }

  void updateTarget(String val) {
    final flg = val.isNotEmpty ? true : false;
    state = state.copyWith(
      target: state.target.copyWith(
        value: val,
        isValid: flg,
      ),
    );
  }

  void updatePrice(String val) {
    late int price;
    if (val != "") {
      price = int.parse(val.replaceAll(",", ""));
    } else {
      price = 0;
    }
    state = state.copyWith(
      price: price,
    );
  }

  Future datePicker(BuildContext context) async {
    final now = DateTime.now();
    final dateTime = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: now,
      maxTime: DateTime(2100, 12, 31),
      onChanged: (date) {},
      onConfirm: (date) {},
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );

    state = state.copyWith(
      targetDate: state.targetDate.copyWith(
        value: dateTime,
        isValid: dateTime != null ? true : false,
      ),
    );
  }

  Future<void> addTarget() async {
    state = state.copyWith(isLoading: true);
    final members = state.members.map((e) => e.uid).toList();
    final uid = ref.read(profileNotifierProvider).uid;

    late Result<String> uploadResult;
    if (state.file != null) {
      uploadResult = await _storageService.uploadImage(state.file!);
    } else {
      uploadResult = Result.value("");
    }
    if (uploadResult.isError) return;

    final TargetState targetState = TargetState(
      target: state.target.value,
      targetPrice: state.price,
      members: [...members, uid],
      imageUrl: uploadResult.asValue!.value,
      currentPercent: 0,
      registeTime: DateTime.now(),
      targetDate: state.targetDate.value!,
    );

    await _targetService.addTarget(targetState);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false);
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
}
