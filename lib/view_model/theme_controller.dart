import 'package:account_book_app/view/theme/my_theme_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeControllerProvider =
    StateNotifierProvider.autoDispose<ThemeController, ExThemeMode>(
  (ref) => throw UnimplementedError(),
);
final themeControllerProviderFamily = StateNotifierProvider.family
    .autoDispose<ThemeController, ExThemeMode, int?>(
  (ref, int? id) => ThemeController(ref, id),
);

class ThemeController extends StateNotifier<ExThemeMode> {
  final Ref ref;
  int? id;
  static String key = "theme_key";

  ThemeController(this.ref, this.id) : super(ExThemeMode.light) {
    state = ExThemeMode.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ExThemeMode.light,
    );
  }

  Future<void> changeTheme(ExThemeMode theme) async {
    state = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, theme.id);
  }
}
