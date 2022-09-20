import 'package:flutter/material.dart';

class ExpendChildBar extends StatelessWidget {
  const ExpendChildBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const Text(
              "食費",
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            const Spacer(),
            const Text(
              "10,000",
              style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
            )
          ],
        ),
      ),
    );
  }
}
