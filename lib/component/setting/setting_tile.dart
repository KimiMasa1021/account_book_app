import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });
  final IconData icon;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
