import 'package:flutter/material.dart';

import '../../../component/statistics/monthly_appbar.dart';

class MonthlyPage extends StatelessWidget {
  const MonthlyPage({required this.setDate, super.key});
  final ValueNotifier<DateTime> setDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MonthlyAppBar(setDate: setDate),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    12,
                    (index) => InkWell(
                      onTap: () {
                        setDate.value = DateTime(setDate.value.year, index + 1);
                        DefaultTabController.of(context)?.animateTo(1);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: (index + 1).toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '月',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: const [
                                Text("400,000"),
                                SizedBox(width: 10),
                                Text("400,000"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
