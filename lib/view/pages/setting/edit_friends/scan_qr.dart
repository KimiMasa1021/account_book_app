import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widget/qr_camera.dart';
import 'widget/qr_code.dart';

// ignore: must_be_immutable
class ScanQr extends HookConsumerWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final flg = useState(true);

    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("QRコードで追加"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: flg.value
                      ? QrCamera(
                          loading: loading,
                          flg: flg,
                        )
                      : QrCode(
                          flg: flg,
                        ),
                ),
              ],
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
      ),
    );
  }
}
