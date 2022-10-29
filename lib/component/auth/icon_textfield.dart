import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constant/hex_color.dart';

class IconTextField extends HookConsumerWidget {
  const IconTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.type,
  });
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final TextInputType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(123),
        ),
        border: Border.all(
          width: 1,
          color: HexColor("850E35").withOpacity(0.19),
        ),
        boxShadow: [
          BoxShadow(
            color: HexColor("850E35").withOpacity(0.24),
            spreadRadius: 0.0,
            blurRadius: 4.0,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controller,
          obscureText: type == TextInputType.visiblePassword ? true : false,
          keyboardType: type,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: HexColor("850E35"),
              size: 30,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
