import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/page_state.dart';

class PageController extends StateNotifier<PageState> {
  final Reader _reader;

  PageController(this._reader) : super(PageState());

  void changePage(Pages page) {
    state = state.copyWith(
      page: page,
    );
    debugPrint(state.page.toString());
  }
}
