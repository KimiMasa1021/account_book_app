import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.function,
  });
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(top: 13),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.grey,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: const [
            Icon(
              Icons.savings_outlined,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "節約記録を追加",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
