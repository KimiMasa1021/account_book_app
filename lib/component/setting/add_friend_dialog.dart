import 'package:flutter/material.dart';

class AddFriendDialog extends StatelessWidget {
  const AddFriendDialog({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

      //  InkWell(
      //       onTap: () {
      //         Navigator.pushNamed(context, FriendAddQr.id);
      //       },
      //       child: const Icon(
      //         Icons.qr_code,
      //         size: 28,
      //         color: Colors.black,
      //       ),
      //     ),
      //     const SizedBox(width: 10),
      //     InkWell(
      //       onTap: () {
      //         Navigator.pushNamed(context, FriendAddScan.id);
      //       },
      //       child: const Icon(
      //         Icons.camera_alt_outlined,
      //         size: 28,
      //         color: Colors.black,
      //       ),
      //     ),