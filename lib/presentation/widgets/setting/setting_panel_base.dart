import 'package:flutter/material.dart';

class SettingPanelBase extends StatelessWidget {
  const SettingPanelBase({
    super.key,
    required this.widgetList,
  });
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: widgetList,
      ),
    );
  }
}
