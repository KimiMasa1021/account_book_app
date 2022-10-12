import 'package:flutter/material.dart';

import '../../../component/statistics/monthly_appbar.dart';

class MonthlyPage extends StatelessWidget {
  const MonthlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MonthlyAppBar(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    12,
                    (index) => Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.3,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
