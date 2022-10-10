import 'package:flutter/material.dart';

class OneDayAppBar extends StatelessWidget {
  const OneDayAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(top: 10),
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
        child: Column(
          children: [
            Row(
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
                  "2022年10月",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text("収入"),
                    Text("1,050,000"),
                  ],
                ),
                Column(
                  children: const [
                    Text("支出"),
                    Text("450,000"),
                  ],
                ),
                Column(
                  children: const [
                    Text("収支"),
                    Text("4250,000"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
