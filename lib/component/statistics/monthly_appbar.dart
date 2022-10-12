import 'package:flutter/material.dart';

class MonthlyAppBar extends StatelessWidget {
  const MonthlyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.grey,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_left,
                size: 50,
              ),
            ),
            const Text(
              "2022年5月",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_right,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
