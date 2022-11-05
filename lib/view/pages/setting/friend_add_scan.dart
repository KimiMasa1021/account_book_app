import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class FriendAddScan extends HookConsumerWidget {
  FriendAddScan({super.key});

  static String id = "friend_add_scan";
  QRViewController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final loading = useState(false);
    final usersController = ref.watch(usersControllerProvider.notifier);

    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) async {
                    this.controller = controller;
                    controller.pauseCamera();
                    controller.resumeCamera();
                    controller.scannedDataStream.listen((scanData) async {
                      loading.value = true;
                      await Future.delayed(const Duration(seconds: 2));

                      usersController.searchUser(scanData.code.toString());
                      loading.value = false;
                    });
                  },
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 270,
                  ),
                ),
              ),
            ],
          ),
        ),
        loading.value
            ? Container(
                color: Colors.grey.withOpacity(0.4),
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
