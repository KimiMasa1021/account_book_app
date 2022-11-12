import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../provider/general_provider.dart';

class FriendAddQr extends HookConsumerWidget {
  const FriendAddQr({super.key});
  static String id = "friend_add_qr";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("QRコードの表示"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              width: double.infinity,
              child: QrImage(
                data: usersState!.uid.toString(),
                version: QrVersions.auto,
              ),
            ),
            const Text(
              "※  同じアプリ同士で読み込みしてください。",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
