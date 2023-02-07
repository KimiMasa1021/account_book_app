import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/theme_controller.dart';
import '../../../theme/my_theme_mode.dart';

class EditDesign extends HookConsumerWidget {
  const EditDesign({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeControllerProvider);
    final modeCTL = ref.watch(themeControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("デザインの変更"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.35,
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
                                    color: ExThemeMode
                                        .values[index].themeData.cardColor,
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
                                          color: ExThemeMode.values[index]
                                              .themeData.colorScheme.tertiary,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: ExThemeMode.values[index]
                                              .themeData.colorScheme.background,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: ExThemeMode.values[index]
                                              .themeData.cardColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            ExThemeMode.values[index].themeName,
                            style: const TextStyle(fontSize: 16),
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
