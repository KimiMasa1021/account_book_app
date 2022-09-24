import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/genre_state.dart';
import '../repository/genre_repository.dart';

class GenreController extends StateNotifier<GenreState> {
  final Reader reader;
  Map<String, dynamic>? data;
  GenreController(this.reader) : super(GenreState()) {
    reader(genreRepositoryProvider).feachGenreList().listen(
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
}
// Future<void> test() async {
//   final test = await reader(addPageRepositoryProvider).fechGenreList();
//   final List<AddPageState?> list = test.map((data) => data.data()).toList();

//   state = state.copyWith(
//     genre: list[0]!.genre,
//   );
//   debugPrint(state.genre.toString());
// }
