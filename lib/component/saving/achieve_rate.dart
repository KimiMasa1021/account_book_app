import 'package:flutter/material.dart';

class AchieveRate extends StatelessWidget {
  const AchieveRate({
    super.key,
    required this.title,
    required this.parsent,
  });
  final String title;
  final String parsent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 13, right: 5),
        height: 100,
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
              "$parsent%",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
