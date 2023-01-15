import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../model/target/target_state.dart';
import '../../../utility/hex_color.dart';
import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';
import '../shapes.dart';

class TargetPanel extends HookConsumerWidget {
  const TargetPanel({
    super.key,
    required this.state,
    required this.function,
  });

  final TargetState state;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final saving = ref.watch(savingControllerProvider);
    final size = MediaQuery.of(context).size;
    final priceList = saving
        .where((e) => e.productId == state.docId)
        .map((e) => e.price)
        .toList();
    int sum;
    if (priceList.isEmpty) {
      sum = 0;
    } else {
      sum = priceList.reduce((a, b) => a + b);
    }
    final percent = sum / state.targetPrice;
    return InkWell(
      onTap: () async {
        await function();
      },
      child: Container(
        width: double.infinity,
        height: 115,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 115,
                  width: 45,
                  decoration: ShapeDecoration(
                    color: theme.appColors.primary,
                    shape: LeftShape(),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 0),
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: 115,
                    decoration: ShapeDecoration(
                      color: theme.appColors.primary,
                      shape: RightShape(),
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.target} (${state.members.length})",
                            style: theme.textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            state.targetDescription,
                            style: theme.textTheme.fs16,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(top: 10, left: 11),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 242, 255),
                shape: BoxShape.circle,
                image: state.img != ""
                    ? DecorationImage(
                        image: NetworkImage(
                          state.img,
                        ),
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 0),
                    blurRadius: 2,
                  )
                ],
              ),
              child: state.img == ""
                  ? FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        state.target.substring(0, 3),
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              bottom: 8.5,
              left: 14,
              child: SizedBox(
                height: 13,
                width: size.width - 58,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percent >= 1.0 ? 1.0 : percent,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("#70D4F7"),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            percent >= 1.0
                ? Positioned(
                    right: 10,
                    top: 10,
                    child: Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "済",
                            style: GoogleFonts.yujiBoku(
                              color: Colors.red,
                              fontSize: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
