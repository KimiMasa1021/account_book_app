import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/users_state.dart';
import '../repository/users_repository.dart';

class UsersController extends StateNotifier<UsersState> {
  final Ref ref;
  Map<String, dynamic>? data;
  UsersController(this.ref) : super(UsersState()) {
    ref.read(usersRepositoryProvider).feachGenreList().listen(
      (data) {
        state = state.copyWith(
          genre: data.map((doc) => doc.data()).toList()[0].genre,
          genre2: data.map((doc) => doc.data()).toList()[0].genre2,
          target: data.map((doc) => doc.data()).toList()[0].target,
          targetPrice: data.map((doc) => doc.data()).toList()[0].targetPrice,
        );
      },
    );
  }

  // Future<void> test() async {
  //   final test = await ref.read(addPageRepositoryProvider).fechGenreList();
  //   final List<AddPageState?> list = test.map((data) => data.data()).toList();

  //   state = state.copyWith(
  //     genre: list[0]!.genre,
  //   );
  //   debugPrint(state.genre.toString());
  // }

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
    debugPrint(state.genre2.toString());
    if (picked == null) {
      outputDate.value = DateTime.now();
      return DateFormat('yyyy/MM/dd').format(DateTime.now());
    }
    outputDate.value = picked;
    final date = DateFormat('yyyy/MM/dd').format(picked);

    return date;
  }
}
// Future<void> test() async {
//   final test = await ref.read(addPageRepositoryProvider).fechGenreList();
//   final List<AddPageState?> list = test.map((data) => data.data()).toList();

//   state = state.copyWith(
//     genre: list[0]!.genre,
//   );
//   debugPrint(state.genre.toString());
// }
