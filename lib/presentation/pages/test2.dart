import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("2"),
        ),
      ),
    );
  }
}
