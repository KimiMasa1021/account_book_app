import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/theme/my_theme_mode.dart';

class ThemeNotifier extends StateNotifier<ExThemeMode> {
  ThemeNotifier({
    required this.id,
  }) : super(ExThemeMode.theme1) {
    state = ExThemeMode.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ExThemeMode.theme1,
    );
  }

  final int? id;
  final String key = "theme_key";

  Future<void> changeTheme(ExThemeMode theme) async {
    state = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, theme.id);
  }
}
