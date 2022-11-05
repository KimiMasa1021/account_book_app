import 'package:flutter/material.dart';

class AddMemberArgment {
  AddMemberArgment({
    required this.setMembers,
  });
  final ValueNotifier<List<String>> setMembers;
}
