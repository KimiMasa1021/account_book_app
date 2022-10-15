import 'package:flutter/material.dart';

class StatisticAppBar extends StatelessWidget {
  const StatisticAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.grey,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 24),
            tabs: <Widget>[
              Tab(text: '月別'),
              Tab(text: '日別'),
              Tab(text: '１日'),
            ],
          ),
        ],
      ),
    );
  }
}
