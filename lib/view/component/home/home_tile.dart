import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constant/hex_color.dart';
import '../../../model/target_state.dart';
import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';

class HomeTile extends HookConsumerWidget {
  const HomeTile({
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
                    shape: _TagShape2(),
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
                      shape: _TagShape(),
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

class _TagShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection!);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 20;
    double edge = 5;

    return Path()
      ..moveTo(rect.left + 5, rect.top)
      ..lineTo(rect.right - radius, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.right, rect.bottom - radius)
      ..arcToPoint(
        Offset(rect.right - radius, rect.bottom),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.left + 5, rect.bottom)
      ..lineTo(rect.left + 5, rect.bottom - edge)
      ..lineTo(rect.right - 20, rect.bottom - edge)
      ..arcToPoint(
        Offset(rect.right - 20, rect.bottom - edge - 20),
        radius: const Radius.circular(5),
        clockwise: false,
      )
      ..lineTo(rect.left + 5, rect.bottom - 25)
      ..lineTo(rect.left + 5, rect.bottom - 30)
      ..lineTo(rect.left, rect.bottom - 30)
      ..arcToPoint(
        Offset(rect.left, rect.top + edge),
        radius: const Radius.circular(36),
        clockwise: false,
      )
      ..lineTo(rect.left + 5, rect.top + edge)
      ..lineTo(rect.left + 5, rect.top)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

class _TagShape2 extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection!);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 20;
    double edge = 5;

    return Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right - 5, rect.top)
      ..lineTo(rect.right - 5, rect.top + edge)
      ..lineTo(rect.right, rect.top + edge)
      ..arcToPoint(
        Offset(rect.right, rect.bottom - 30),
        radius: const Radius.circular(36),
        clockwise: false,
      )
      ..lineTo(rect.right - 5, rect.bottom - 30)
      ..lineTo(rect.right - 5, rect.bottom - 25)
      ..lineTo(rect.left + 20, rect.bottom - 25)
      ..arcToPoint(
        Offset(rect.left + 20, rect.bottom - 5),
        radius: const Radius.circular(5),
        clockwise: false,
      )
      ..lineTo(rect.right - 5, rect.bottom - 5)
      ..lineTo(rect.right - 5, rect.bottom)
      ..lineTo(rect.left + radius, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.left, rect.top + radius)
      ..arcToPoint(
        Offset(rect.left + radius, rect.top),
        radius: Radius.circular(radius),
      )
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
