import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    super.key,
    required this.title,
    required this.fucntion,
  });
  final String title;
  final Function() fucntion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => fucntion(),
        child: Container(
          margin: const EdgeInsets.only(top: 13, left: 5),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
