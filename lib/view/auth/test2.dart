import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key, required this.testText}) : super(key: key);
  final String testText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test2 : $testText',
        ),
      ),
    );
  }
}
