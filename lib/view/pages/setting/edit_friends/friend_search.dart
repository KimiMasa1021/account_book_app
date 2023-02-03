import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendSearch extends ConsumerWidget {
  const FriendSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final font = ref.watch(myTextTheme);
    // final controller = useTextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンド検索"),
      ),
      // body: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   width: double.infinity,
      //   height: 55,
      //   decoration: BoxDecoration(
      //     color: Theme.of(context).colorScheme.surface,
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Center(
      //     child: TextFormField(
      //       controller: controller,
      //       keyboardType: TextInputType.emailAddress,
      //       decoration: InputDecoration(
      //         hintText: "フレンドIDを入力してね",
      //         hintStyle: font.fs19,
      //         contentPadding: EdgeInsets.zero,
      //         isCollapsed: true,
      //         focusedBorder: InputBorder.none,
      //         border: InputBorder.none,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
