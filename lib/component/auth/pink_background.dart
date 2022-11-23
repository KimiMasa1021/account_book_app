import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/enums.dart';
import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class PinkBackGround extends HookConsumerWidget {
  const PinkBackGround({
    super.key,
    required this.heightScale,
    this.title,
  });
  final double heightScale;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final statusSize = MediaQuery.of(context).padding;
    final switcherController = ref.watch(authSwitcherPriovider.notifier);

    return Align(
      alignment: const Alignment(0, -1),
      child: Container(
        width: size.width,
        height: size.height * heightScale,
        decoration: BoxDecoration(
          color: HexColor("#FDA857"),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: statusSize.top + 20,
          ),
          child: title != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        switcherController.state = Pages.top;
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Text(
                      title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
