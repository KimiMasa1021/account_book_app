import 'package:account_book_app/application/providers/theme_provider/provider/tags_provider.dart';
import 'package:account_book_app/presentation/widgets/edit_theme/theme_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/theme/app_text_theme.dart';
import '../../common/theme/my_theme_mode.dart';

class EditThemePage extends ConsumerWidget {
  const EditThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeCTL = ref.watch(themeProvider.notifier);
    final font = ref.watch(myTextTheme);

    return Scaffold(
      appBar: AppBar(
        title: const Text("テーマの変更"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "明るいテーマ",
                style: font.fs16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...List.generate(
                3,
                (index) {
                  return ThemePanel(
                    onTap: () =>
                        themeCTL.changeTheme(ExThemeMode.values[index]),
                    index: index,
                  );
                },
              ),
              Text(
                "暗めのテーマ",
                style: font.fs16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...List.generate(
                4,
                (index) {
                  return ThemePanel(
                    onTap: () =>
                        themeCTL.changeTheme(ExThemeMode.values[index + 3]),
                    index: index + 3,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// final themeControllerProviderFamily = StateNotifierProvider.family
//     .autoDispose<ThemeController, ExThemeMode, int?>(
//   (ref, int? id) => ThemeController(ref, id),
// );

// class ThemeController extends StateNotifier<ExThemeMode> {
//   final Ref ref;
//   int? id;
//   static String key = "theme_key";

  // ThemeController(this.ref, this.id) : super(ExThemeMode.theme1) {
    // state = ExThemeMode.values.firstWhere(
    //   (e) => e.id == id,
    //   orElse: () => ExThemeMode.theme1,
    // );
  // }

//   Future<void> changeTheme(ExThemeMode theme) async {
//     state = theme;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(key, theme.id);
//   }
// }
// Expanded(
//   child: GridView.count(
//     crossAxisCount: 3,
//     mainAxisSpacing: 0,
//     crossAxisSpacing: 0,
//     childAspectRatio: 1 / 1.3,
//     children: [
//       ...List.generate(
//         ExThemeMode.values.length,
//         (index) => InkWell(
//           onTap: () {
//             modeCTL.changeTheme(ExThemeMode.values[index]);
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               AspectRatio(
//                 aspectRatio: 1,
//                 child: Container(
//                   padding: const EdgeInsets.all(7),
//                   margin: const EdgeInsets.symmetric(horizontal: 15),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: ExThemeMode.values[index] == mode
//                         ? Border.all(
//                             width: 3,
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .onBackground,
//                           )
//                         : null,
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         width: 3,
//                         color: ExThemeMode.values[index].themeData
//                             .colorScheme.tertiary,
//                       ),
//                     ),
//                     child: Container(
//                       clipBehavior: Clip.hardEdge,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 color: ExThemeMode.values[index]
//                                     .themeData.colorScheme.secondary),
//                           ),
//                           Expanded(
//                             child: Container(
//                               color: ExThemeMode.values[index]
//                                   .themeData.colorScheme.background,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               color: ExThemeMode.values[index]
//                                   .themeData.colorScheme.tertiary,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 ExThemeMode.values[index].themeName,
//                 style: font.fs16,
//               )
//             ],
//           ),
//         ),
//       )
//     ],
//   ),
// )
