import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common/theme/app_text_theme.dart';

class FriendsEmpty extends ConsumerWidget {
  const FriendsEmpty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          // SvgPicture.asset(
          //   SvgUrl.team.url,
          //   height: size.width / 3,
          //   width: size.width / 3,
          // ),
          Text(
            "現在フレンドが登録されてません",
            style: font.fs19.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '右上の ',
                  style: font.fs16.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.person_add,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                TextSpan(
                  text: ' アイコンをタップすることでフレンドを登録できます！',
                  style: font.fs16.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
