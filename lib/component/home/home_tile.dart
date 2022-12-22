import 'package:account_book_app/view/pages/home/home_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constant/hex_color.dart';
import '../../model/target_state.dart';
import '../../view/theme/app_theme.dart';

class HomeTile extends HookConsumerWidget {
  const HomeTile({
    super.key,
    required this.target,
    required this.description,
    required this.percent,
    required this.state,
  });
  final String target;
  final String description;
  final double percent;
  final TargetState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return InkWell(
      onTap: () {
        context.pushNamed(HomeDetails.name);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(right: 7, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        state.img,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 0),
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.target,
                        style: theme.textTheme.fs19.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.targetDescription,
                        style: theme.textTheme.fs16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HexColor("#E0E0E0"),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: percent,
                          heightFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor("#70D4F7"),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${(percent * 100).floor()}%",
                    style: theme.textTheme.fs19.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
