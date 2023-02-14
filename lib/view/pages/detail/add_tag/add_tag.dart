import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTag extends ConsumerWidget {
  const AddTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("タグの追加・編集"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
