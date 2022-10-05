import 'package:flutter/material.dart';

class TargetCard extends StatelessWidget {
  const TargetCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.grey,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 88, 88, 88),
            ),
          ),
          Text(
            subTitle.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
