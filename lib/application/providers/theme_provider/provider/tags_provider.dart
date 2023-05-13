import 'package:account_book_app/application/providers/theme_provider/notifier/theme_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/theme/my_theme_mode.dart';
import '../../../services/tags_service.dart';

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeNotifier, ExThemeMode>(
  (ref) => throw UnimplementedError(),
);
final themeFamilyProvider =
    StateNotifierProvider.family.autoDispose<ThemeNotifier, ExThemeMode, int?>(
  (ref, int? id) => ThemeNotifier(
    tagsService: ref.read(tagsServiceProvider),
    id: id,
  ),
);
// final themeControllerProvider =
//     StateNotifierProvider.autoDispose<ThemeController, ExThemeMode>(
//   (ref) => throw UnimplementedError(),
// );
// final themeControllerProviderFamily = StateNotifierProvider.family
//     .autoDispose<ThemeController, ExThemeMode, int?>(
//   (ref, int? id) => ThemeController(ref, id),
// );
