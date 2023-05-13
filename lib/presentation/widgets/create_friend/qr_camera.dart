import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../application/providers/create_friend_provider/provider/create_friend_provider.dart';
import '../../../common/theme/app_text_theme.dart';

class QrCamera extends ConsumerWidget {
  const QrCamera({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);
    final createFriendCTL = ref.watch(createFriendProvider.notifier);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) async =>
                  await createFriendCTL.onQRViewCreated(
                controller,
                () => createFriendCTL.pushProfilePage(context),
              ),
              overlay: QrScannerOverlayShape(
                borderColor: Theme.of(context).colorScheme.secondary,
                overlayColor: Theme.of(context).colorScheme.surface,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: size.width / 2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 60,
                  ),
                  Text(
                    "スキャン",
                    style: font.fs16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => createFriendCTL.changePage(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Icon(
                        Icons.qr_code,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    Text(
                      "マイQRコード",
                      style: font.fs16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
