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
