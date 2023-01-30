import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.backgroundColor,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });
  final Color backgroundColor;
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => InkWell(
            onTap: () async => await onTap(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: currentIndex == index
                  ? items[index].activeIcon
                  : items[index].icon,
            ),
          ),
        ),
      ),
    );
  }
}
