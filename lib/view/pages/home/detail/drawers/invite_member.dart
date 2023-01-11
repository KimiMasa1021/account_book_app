import 'package:flutter/material.dart';

class InviteMember extends StatelessWidget {
  const InviteMember({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("招待"),
      ),
      body: Center(
        child: Text(docId),
      ),
    );
  }
}
