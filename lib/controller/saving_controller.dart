import 'package:account_book_app/model/target_state.dart';
import 'package:account_book_app/repository/saving_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/general_provider.dart';

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
    Function() fucntion,
  ) async {
    final userState = ref.read(usersControllerProvider);
    final memberLists = ref.read(memberListProvider);
    if (target == "" || targetPrice == "" || groupName == "") {
      return showToast("すべて必須項目ですよ");
    }

    final list = [...memberLists, userState!];

    int price = int.parse(targetPrice.replaceAll(",", ""));
    List<String> membersListUid = list.map((e) => e.uid).toList();
    await ref.read(savingRepositoryProvider).initTarget(
          target,
          price,
          groupName,
          membersListUid,
        );

    if (state.length != 1) {
      fucntion();
    }
  }

  Future<void> addSaving(DateTime registedTime, String price, String memo,
      String uid, String member, Function() function) async {
    final formatPrice = int.parse(price.replaceAll(",", ""));
    await ref.read(savingRepositoryProvider).addSaving(
          registedTime,
          formatPrice,
          memo,
          uid,
          member,
        );
    function();
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

  Future<void> addMember(
    String docId,
    List<String> newList,
    List<String> oldList,
    Function() function,
  ) async {
    await ref.read(savingRepositoryProvider).addMember(docId, newList, oldList);
    function();
  }

  Future<void> seceesion(
    String docId,
    List<String> list,
    Function() function,
  ) async {
    await ref.read(savingRepositoryProvider).seceesion(docId, list);
    function();
  }
}
