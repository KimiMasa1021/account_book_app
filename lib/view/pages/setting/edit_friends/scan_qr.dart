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

    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        const QrCode(),
                        QrCamera(
                          loading: loading,
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    indicatorWeight: 5,
                    indicatorColor: Theme.of(context).colorScheme.onBackground,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onBackground,
                    tabs: const [
                      Tab(text: "マイQRコード"),
                      Tab(text: "スキャン"),
                    ],
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
      ),
    );
  }
}
