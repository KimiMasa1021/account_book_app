import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.leftIcon,
    required this.rightIcon,
    required this.leftFunction,
    required this.rightFunction,
    required this.leftTitle,
    required this.rightTitle,
  });
  final IconData leftIcon;
  final IconData rightIcon;
  final Function() leftFunction;
  final Function() rightFunction;
  final String leftTitle;
  final String rightTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        InkWell(
          onTap: () async {
            await leftFunction();
          },
          child: Container(
            width: size.width * 0.3,
            height: size.width * 0.3,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: const Offset(3, 5),
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leftIcon,
                  size: 40,
                ),
                Text(leftTitle),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            onTap: () async {
              await rightFunction();
            },
            child: Container(
              height: size.width * 0.33,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: const Offset(3, 5),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    rightIcon,
                    size: 40,
                  ),
                  const SizedBox(width: 5),
                  Text(rightTitle),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
