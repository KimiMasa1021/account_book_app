import 'package:account_book_app/constant/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;
import '../../../component/home/home_details_tile.dart';
import '../../theme/app_theme.dart';

class HomeDetails extends HookConsumerWidget {
  const HomeDetails({super.key});
  static String name = "home_details";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = ref.watch(appThemeProvider);
    final pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 1,
    );
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "草津温泉旅行",
          style: TextStyle(
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 230,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 230,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        width: size.width,
                        child: PageView(
                          controller: pageController,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 200,
                              decoration: BoxDecoration(
                                color: HexColor("#FFB0B0"),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: HexColor("#B3FFFC"),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 0),
                                  child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Transform.scale(
                                      scale: 1.15,
                                      child: CustomPaint(
                                        painter: MyPainter(percent: 25),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "達成金額",
                                        style: theme.textTheme.fs19.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "50,300円",
                                        style: theme.textTheme.fs33.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 10),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 0),
                                          Text(
                                            "目標金額",
                                            style:
                                                theme.textTheme.fs16.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "1,050,300円",
                                            style:
                                                theme.textTheme.fs27.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 200,
                              decoration: BoxDecoration(
                                color: HexColor("#E0FED9"),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (_, int index) {
                  return index != 0
                      ? const HomeDetailsTile()
                      : Column(
                          children: [
                            Container(
                              height: 10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    offset: const Offset(0, -3),
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                            ),
                            const HomeDetailsTile(),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.percent});
  final double percent;
  @override
  void paint(Canvas canvas, Size size) {
    double storeke = 20;
    final bottom = Offset(size.width / 2, size.height / 1.2);
    final backgroundPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.black12
      ..strokeWidth = storeke;
    final progressPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = const Color.fromARGB(255, 253, 255, 115)
      ..strokeWidth = storeke;
    //背景描画
    canvas.drawArc(
      Rect.fromCenter(
        center: bottom,
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      backgroundPainter,
    );
    //インジゲーター描画
    double end = percent / 100;
    canvas.drawArc(
      Rect.fromCenter(
        center: bottom,
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi * end,
      false,
      progressPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
