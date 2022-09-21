import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/add_page_state.dart';
import '../repository/add_page_repository.dart';

class AddPageController extends StateNotifier<AddPageState> {
  final Reader reader;
  AddPageController(this.reader) : super(AddPageState()) {
    reader(addPageRepositoryProvider)
        .fetchGenreList
        .listen((QuerySnapshot snapshot) {
      snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
        final list = data['email'];
        state = state.copyWith(genre: list);
      });
    });
    debugPrint(state.genre.toString());
  }

  Future<String> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
    );
    debugPrint(state.genre.toString());
    if (picked == null) return DateFormat('yyyy/MM/dd').format(DateTime.now());
    final date = DateFormat('yyyy/MM/dd').format(picked);
    return date;
  }
}
