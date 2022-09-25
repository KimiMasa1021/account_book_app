import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class ExpendBar extends StatelessWidget {
  const ExpendBar({required this.price, super.key});
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              "支出",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const Spacer(),
            Text(
              NumberFormat("#,###").format(price),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
