import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../model/users_state.dart';
import '../provider/general_provider.dart';
import '../repository/users_repository.dart';

class UsersController extends StateNotifier<UsersState> {
  final Ref ref;
  Map<String, dynamic>? data;
  UsersController(this.ref) : super(UsersState()) {
    ref
        .read(usersRepositoryProvider)
        .feachGenreList()
        .listen((data) => state = data!);
  }

  Future<String> selectDate(
      BuildContext context, ValueNotifier<DateTime> outputDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
    );
    if (picked == null) {
      outputDate.value = DateTime.now();
      return DateFormat('yyyy/MM/dd').format(DateTime.now());
    }
    outputDate.value = picked;
    final date = DateFormat('yyyy/MM/dd').format(picked);

    return date;
  }

  Future<void> searchUser(String uid) async {
    final myUid = ref.read(authControllerProvider)!.uid;
    String msg = "";
    final result = await ref.read(usersRepositoryProvider).searchUser(uid);
    if (result == null) {
      msg = "ユーザーが存在しないか無効なQRコードです。";
      shwoToast(msg);
      return;
    }
    if (result.friends.contains(myUid)) {
      msg = "既にフレンドに登録済みです";
      shwoToast(msg);
      return;
    }
    if (result.uid == uid) {
      List friendList = [];
      for (int i = 0; i < result.friends.length; i++) {
        friendList.add(result.friends[i]);
      }
      friendList.add(myUid);

      List myList = [];
      for (int i = 0; i < state.friends.length; i++) {
        myList.add(state.friends[i]);
      }
      myList.add(uid);
      await ref.read(usersRepositoryProvider).makeFriend(
            result.uid,
            friendList,
            myList,
          );
      msg = "${result.name}さんとフレンドになりました。";
      shwoToast(msg);

      return;
    }
  }

  void shwoToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      textColor: Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }

  final picker = ImagePicker();
  Future<void> getImageFromGarary(ValueNotifier<File?> value) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      value.value = null;
      return;
    }

    value.value = File(pickedFile.path);
  }

  Future<void> getImageFromCamera(ValueNotifier<File?> value) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) {
      value.value = null;
      return;
    }

    value.value = File(pickedFile.path);
  }
}
