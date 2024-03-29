import 'package:flutter/material.dart';

import '../../../common/hex_color.dart';

class PictureDialog extends StatelessWidget {
  const PictureDialog({
    super.key,
    required this.galleryFunction,
    required this.cameraFunction,
    required this.deleteFunction,
  });
  final Function() galleryFunction;
  final Function() cameraFunction;
  final Function() deleteFunction;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: HexColor("#615C5C"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () async {
            cameraFunction();
            Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Text(
            "写真を撮る",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        SimpleDialogOption(
          onPressed: () async {
            galleryFunction();
            Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Text(
            "フォルダから画像を選択",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        SimpleDialogOption(
          onPressed: () async {
            deleteFunction();
            Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Text(
            "削除する",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
