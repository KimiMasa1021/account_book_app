import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/theme_controller.dart';
import '../../../theme/my_theme_mode.dart';

class DesignManagement extends HookConsumerWidget {
  const DesignManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final mode = ref.watch(themeControllerProvider);
    final modeCTL = ref.watch(themeControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("デザインの変更"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...List.generate(
                  ExThemeMode.values.length,
                  (index) => ExThemeMode.values[index] != ExThemeMode.system
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                modeCTL.changeTheme(ExThemeMode.values[index]);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: size.width / 3.2,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5 * 1.2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: ExThemeMode.values[index] == mode
                                          ? Border.all(
                                              width: 3,
                                              color: Colors.blue,
                                            )
                                          : null,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
