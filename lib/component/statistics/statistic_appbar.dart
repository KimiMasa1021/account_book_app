import 'package:flutter/material.dart';

class StatisticAppBar extends StatelessWidget {
  const StatisticAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
              ),
              const Text(
                "2022年10月",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_right,
                  size: 50,
                ),
              ),
            ],
          ),
          const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 24),
            tabs: <Widget>[
              Tab(text: '１日'),
              Tab(text: '日別'),
              Tab(text: '月別'),
            ],
          ),
        ],
      ),
    );
  }
}
