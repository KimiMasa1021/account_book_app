import 'package:flutter/material.dart';

class EditProject extends StatelessWidget {
  const EditProject({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロジェクトの編集"),
      ),
      body: Center(
        child: Text(docId),
      ),
    );
  }
}
