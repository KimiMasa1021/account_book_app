import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/add_page_state.dart';
import '../repository/add_page_repository.dart';

class AddPageController extends StateNotifier<AddPageState> {
  final Reader reader;
  Map<String, dynamic>? data;
  AddPageController(this.reader) : super(AddPageState()) {
    reader(addPageRepositoryProvider).testList().listen(
      (data) {
        state = state.copyWith(
            genre: data.map((doc) => doc.data()).toList()[0].genre);
      },
    );
  }

  // Future<void> test() async {
  //   final test = await reader(addPageRepositoryProvider).fechGenreList();
  //   final List<AddPageState?> list = test.map((data) => data.data()).toList();

  //   state = state.copyWith(
  //     genre: list[0]!.genre,
  //   );
  //   debugPrint(state.genre.toString());
  // }

  Future<String> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
    );
    if (picked == null) return DateFormat('yyyy/MM/dd').format(DateTime.now());
    final date = DateFormat('yyyy/MM/dd').format(picked);
    return date;
  }
}
// Future<void> test() async {
//   final test = await reader(addPageRepositoryProvider).fechGenreList();
//   final List<AddPageState?> list = test.map((data) => data.data()).toList();

//   state = state.copyWith(
//     genre: list[0]!.genre,
//   );
//   debugPrint(state.genre.toString());
// }
