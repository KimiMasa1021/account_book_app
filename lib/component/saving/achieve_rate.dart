import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AchieveRate extends HookConsumerWidget {
  const AchieveRate({
    super.key,
    required this.title,
    required this.parsent,
  });
  final String title;
  final double parsent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 13, right: 5),
        height: 100,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.grey,
              blurRadius: 3,
            ),
          ],
        ),
        child: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(
                colors: [const Color(0xFF00BBF9)],
                durations: [4000],
                heightPercentages: [1 - (parsent / 100)],
              ),
              backgroundColor: Colors.white,
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 0,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 88, 88, 88),
                    ),
                  ),
                  Text(
                    "${parsent.toStringAsFixed(1)}%",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
