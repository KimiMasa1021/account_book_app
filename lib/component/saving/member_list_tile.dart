import 'package:flutter/material.dart';

class MemberListTile extends StatelessWidget {
  const MemberListTile({
    super.key,
    required this.img,
    required this.name,
  });
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: img != ""
                  ? DecorationImage(
                      image: NetworkImage(img),
                    )
                  : const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/img/profile.png"),
                    ),
              border: Border.all(),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
