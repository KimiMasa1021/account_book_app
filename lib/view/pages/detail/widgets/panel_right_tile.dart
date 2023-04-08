import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../theme/app_text_theme.dart';

class PanelRightTile extends ConsumerWidget {
  const PanelRightTile({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.unit,
  });
  final IconData icon;
  final String title;
  final String content;
  final String unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              icon,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: font.fs16.copyWith(),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: content,
                      style: font.fs27.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: unit,
                      style: font.fs16.copyWith(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
