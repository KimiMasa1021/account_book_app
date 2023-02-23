import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/theme_controller.dart';
import '../../../theme/app_text_theme.dart';
import '../../../theme/my_theme_mode.dart';

class EditDesign extends HookConsumerWidget {
  const EditDesign({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeControllerProvider);
    final modeCTL = ref.watch(themeControllerProvider.notifier);
    final font = ref.watch(myTextTheme);

    return Scaffold(
      appBar: AppBar(
        title: const Text("デザインの変更"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 1 / 1.3,
                children: [
                  ...List.generate(
                    ExThemeMode.values.length,
                    (index) => InkWell(
                      onTap: () {
                        modeCTL.changeTheme(ExThemeMode.values[index]);
                      },
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: ExThemeMode.values[index] == mode
                                    ? Border.all(
                                        width: 3,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      )
                                    : null,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3,
                                    color: ExThemeMode.values[index].themeData
                                        .colorScheme.tertiary,
                                  ),
                                ),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            color: ExThemeMode
                                                .values[index]
                                                .themeData
                                                .colorScheme
                                                .secondary),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: ExThemeMode.values[index]
                                              .themeData.backgroundColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: ExThemeMode.values[index]
                                              .themeData.colorScheme.tertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ExThemeMode.values[index].themeName,
                            style: font.fs16,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
