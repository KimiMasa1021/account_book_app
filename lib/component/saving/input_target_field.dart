import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTargetField extends StatelessWidget {
  InputTargetField({
    super.key,
    required this.title,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.formatter,
    this.boxHeight,
    this.lineHeight,
  });
  final String title;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  double? boxHeight;
  int? lineHeight;
  List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          height: boxHeight ?? 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.grey,
                blurRadius: 3,
              ),
            ],
          ),
          child: TextFormField(
            keyboardType: inputType,
            maxLines: lineHeight ?? 1,
            inputFormatters: formatter ?? [],
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 66, 66, 66),
              ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
