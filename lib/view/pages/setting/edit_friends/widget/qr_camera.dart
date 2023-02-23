import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../../view_model/friend_controller.dart';

// ignore: must_be_immutable
class QrCamera extends ConsumerWidget {
  QrCamera({
    super.key,
    required this.loading,
  });
  QRViewController? controller;
  final ValueNotifier<bool> loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final friendCTL = ref.watch(friendsControllerProvider.notifier);
    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) async {
        this.controller = controller;
        controller.pauseCamera();
        controller.resumeCamera();
        controller.scannedDataStream.listen(
          (scanData) async {
            loading.value = true;
            await friendCTL.qrFriendRequest(
              scanData.code.toString(),
            );
            loading.value = false;
          },
        );
      },
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        overlayColor: Colors.black.withOpacity(0.8),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 270,
      ),
    );
  }
}
