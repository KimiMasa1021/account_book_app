import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("1"),
        ),
      ),
    );
  }
}
