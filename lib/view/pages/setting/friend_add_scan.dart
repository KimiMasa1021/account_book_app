import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FriendAddScan extends HookConsumerWidget {
  FriendAddScan({super.key});

  static String id = "friend_add_scan";
  QRViewController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final loading = useState(false);
    final usersController = ref.watch(usersControllerProvider.notifier);
    final usersState = ref.watch(usersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: DefaultTabController(
        animationDuration: Duration(microseconds: 0),
        length: 2,
        initialIndex: 0,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Expanded(
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: (controller) async {
                          this.controller = controller;
                          controller.pauseCamera();
                          controller.resumeCamera();
                          controller.scannedDataStream.listen(
                            (scanData) async {
                              loading.value = true;
                              await Future.delayed(const Duration(seconds: 2));

                              usersController
                                  .searchUser(scanData.code.toString());
                              loading.value = false;
                            },
                          );
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
                    Center(
                      child: QrImage(
                        size: 270,
                        data: usersState!.uid.toString(),
                        version: QrVersions.auto,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.grey,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "※同じアプリ同士で読み込みを行ってください。",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Colors.red,
                      indicatorWeight: 10,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: 24),
                      tabs: <Widget>[
                        Tab(text: 'スキャン'),
                        Tab(text: 'QRコード'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


    // return Stack(
    //   children: [
    //     Scaffold(
    //       body: Column(
    //         children: <Widget>[
    //           Expanded(
    //             flex: 5,
    //             child: QRView(
    //               key: qrKey,
    //               onQRViewCreated: (controller) async {
    //                 this.controller = controller;
    //                 controller.pauseCamera();
    //                 controller.resumeCamera();
    //                 controller.scannedDataStream.listen(
    //                   (scanData) async {
    //                     loading.value = true;
    //                     await Future.delayed(const Duration(seconds: 2));

    //                     usersController.searchUser(scanData.code.toString());
    //                     loading.value = false;
    //                   },
    //                 );
    //               },
    //               overlay: QrScannerOverlayShape(
    //                 borderColor: Colors.red,
    //                 borderRadius: 10,
    //                 borderLength: 30,
    //                 borderWidth: 10,
    //                 cutOutSize: 270,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //               decoration: BoxDecoration(),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     loading.value
    //         ? Container(
    //             color: Colors.grey.withOpacity(0.4),
    //             width: double.infinity,
    //             height: double.infinity,
    //             child: const Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           )
    //         : const SizedBox(),
    //   ],
    // );