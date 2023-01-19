import 'package:account_book_app/view/theme/my_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view/theme/my_theme_data.dart';

class ThemeController extends StateNotifier<ExThemeMode> {
  final Ref ref;
  final int id;
  ThemeController(this.ref, this.id) : super(ExThemeMode.light) {
    state = ExThemeMode.values.firstWhere((e) => e.id == id);
  }
}
