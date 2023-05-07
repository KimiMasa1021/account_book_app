import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view/theme/app_text_theme.dart';

class InfoPanel extends HookConsumerWidget {
  const InfoPanel({
    super.key,
    required this.title,
    required this.icon,
    required this.text,
    required this.unit,
    this.rightWidget = const SizedBox(),
  });

  final String title;
  final IconData icon;
  final String text;
  final String unit;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Icon(
              icon,
              size: 25,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: font.fs16),
              RichText(
                text: TextSpan(
                  style: font.fs16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(
                      text: text,
                      style: font.fs27.copyWith(
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: unit,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          rightWidget,
        ],
      ),
    );
  }
}
