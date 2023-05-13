import 'package:account_book_app/application/providers/create_friend_provider/provider/create_friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/create_friend/qr_camera.dart';
import '../widgets/create_friend/qr_code.dart';

class CreateFriendPage extends ConsumerWidget {
  const CreateFriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createFriend = ref.watch(createFriendProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("QRコードで追加"),
          ),
          body: Column(
            children: [
              Expanded(
                child:
                    createFriend.pageType ? const QrCode() : const QrCamera(),
              ),
            ],
          ),
        ),
        createFriend.isLoading
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
