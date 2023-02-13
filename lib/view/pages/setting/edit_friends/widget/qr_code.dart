import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../view_model/users_controller.dart';
import '../../../../theme/app_text_theme.dart';

class QrCode extends ConsumerWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final font = ref.watch(myTextTheme);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          QrImage(
            size: MediaQuery.of(context).size.width / 2.2,
            data: usersState!.uid.toString(),
            version: QrVersions.auto,
            foregroundColor: Theme.of(context).colorScheme.onBackground,
          ),
          Text(
            "マイQRコード",
            style: font.fs19.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "相手のスマートフォンでこのQRコードをスキャンすることで承認リクエストを受信できます",
            style: font.fs19.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
