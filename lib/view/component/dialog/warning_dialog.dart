import 'package:account_book_app/provider/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../button/painted_button.dart';

class WarningDialog extends HookConsumerWidget {
  const WarningDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: SizedBox(
        height: size.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(
                "assets/json/warning.json",
                width: size.width / 3,
                height: size.width / 3,
                frameRate: FrameRate(60),
                repeat: true,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Text(
                        "注意",
                        // style: theme.textTheme.fs27.copyWith(
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "退会した場合はフレンドに招待してもらわなければ再参加出来ません。",
                        // style: theme.textTheme.fs19.copyWith(),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      PaintedButton(
                        text: '退会する',
                        textColor: Theme.of(context).colorScheme.error,
                        backgroundColor: Colors.white,
                        borderColor: Theme.of(context).colorScheme.error,
                        fucntion: () {
                          context.go(Routes.path().root);
                        },
                      ),
                      const SizedBox(height: 10),
                      PaintedButton(
                        text: 'キャンセル',
                        textColor: Theme.of(context).colorScheme.onError,
                        backgroundColor: Theme.of(context).colorScheme.error,
                        borderColor: Theme.of(context).colorScheme.error,
                        fucntion: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
