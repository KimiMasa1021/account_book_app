import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_left,
                size: 50,
              ),
              Text(
                "2022年9月",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Icon(
                Icons.arrow_right,
                size: 50,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text("収入"),
                  Text(
                    "450,000",
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text("収入"),
                  Text(
                    "450,000",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text("収入"),
                  Text("450,000"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
