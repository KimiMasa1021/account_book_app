import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/statistics/one_day_appbar.dart';
import '../../../component/statistics/one_day_panel.dart';
import '../../../provider/general_provider.dart';

class OneDayPage extends HookConsumerWidget {
  const OneDayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(processingPriceProvider).when(
      data: (state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    Column(
                      children: List.generate(
                        31,
                        (index) => OneDayPanel(
                          day: (index + 1).toString(),
                          list: state.monthlyState
                              .where((val) => val.registeTime.day == index + 1)
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const OneDayAppBar(),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("えらーですねぇえ"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
