import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class MonthlyAppBar extends StatelessWidget {
  const MonthlyAppBar({required this.setDate, super.key});
  final ValueNotifier<DateTime> setDate;

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
              onTap: () {
                setDate.value = DateTime(
                  setDate.value.year - 1,
                );
              },
              child: const Icon(
                Icons.arrow_left,
                size: 50,
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: DateFormat('yyyy').format(setDate.value),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: '年',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setDate.value = DateTime(
                  setDate.value.year + 1,
                );
              },
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
