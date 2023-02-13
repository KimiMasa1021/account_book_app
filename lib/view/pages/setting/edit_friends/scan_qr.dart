import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../theme/app_text_theme.dart';
import 'widget/qr_camera.dart';
import 'widget/qr_code.dart';

// ignore: must_be_immutable
class ScanQr extends HookConsumerWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final font = ref.watch(myTextTheme);

    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("QRコードで追加"),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: TabBarView(
                      children: [
                        const QrCode(),
                        QrCamera(
                          loading: loading,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 56,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            labelStyle: font.fs16,
                            labelColor:
                                Theme.of(context).colorScheme.onSecondary,
                            unselectedLabelColor:
                                Theme.of(context).colorScheme.onTertiary,
                            tabs: const [
                              Tab(text: "マイQRコード"),
                              Tab(text: "スキャン"),
                            ],
                          ),
                        ),
                      ],
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
      ),
    );
  }
}
