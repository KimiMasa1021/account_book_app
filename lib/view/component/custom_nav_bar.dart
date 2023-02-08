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
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => InkWell(
            onTap: () async => await onTap(index),
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? Theme.of(context).colorScheme.tertiary
                    : null,
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
