import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../provider/general_provider.dart';

class FriendsQrScan extends HookConsumerWidget {
  FriendsQrScan({super.key});

  QRViewController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final loading = useState(false);
    final friendCTL = ref.watch(friendControllerProvider.notifier);
    final usersState = ref.watch(usersControllerProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      QRView(
                        key: qrKey,
                        onQRViewCreated: (controller) async {
                          this.controller = controller;
                          controller.pauseCamera();
                          controller.resumeCamera();
                          controller.scannedDataStream.listen(
                            (scanData) async {
                              loading.value = true;
                              await friendCTL.testFriendAdd(
                                usersState!.uid,
                                scanData.code.toString(),
                              );
                              loading.value = false;
                            },
                          );
                        },
                        overlay: QrScannerOverlayShape(
                          borderColor: Colors.white,
                          overlayColor: Colors.black.withOpacity(0.6),
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 270,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Stack(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                            ),
                                            child: Center(
                                              child: QrImage(
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                data:
                                                    usersState!.uid.toString(),
                                                version: QrVersions.auto,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 40),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 90),
                                            child: Text(
                                              "QRコードを読み取って、友達を追加しましょう。",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.close,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 45,
                            width: 200,
                            padding: const EdgeInsets.only(left: 12),
                            margin: const EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(300),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "マイQRコード",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 170,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.grey,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "QRコードをスキャンして友達追加などの機能を利用できます。",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        loading.value
            ? Container(
                color: Colors.grey.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
