import 'package:flutter/material.dart';

class MemberList extends StatelessWidget {
  const MemberList({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メンバーリスト"),
      ),
      body: Center(
        child: Text(docId),
      ),
    );
  }
}
