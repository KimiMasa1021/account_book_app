import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/repository/saving_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/saving_state.dart';
import '../model/users_state.dart';

class SavingController extends StateNotifier<List<TargetState>> {
  final Ref ref;
  SavingController(this.ref) : super([]) {
    ref.read(savingRepositoryProvider).feachSaving().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }

  Future<void> initTarget(
    String target,
    String targetPrice,
    String groupName,
    List<UsersState> membersList,
  ) async {
    int price = int.parse(targetPrice.replaceAll(",", ""));
    List<String> membersListUid = membersList.map((e) => e.uid).toList();
    await ref.read(savingRepositoryProvider).initTarget(
          target,
          price,
          groupName,
          membersListUid,
        );
  }

  Future<void> addSaving(DateTime registedTime, int price, String memo) async {
    // await ref
    //     .read(savingRepositoryProvider)
    //     .addSaving(registedTime, price, memo);
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 0),
      ),
      firstDate: DateTime.now().add(
        const Duration(days: 0),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 7000),
      ),
    );
    if (picked == null) {
      return DateTime.now();
    }

    return picked;
  }
}
