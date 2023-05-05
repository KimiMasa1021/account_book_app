import 'package:account_book_app/presentation/widgets/statistic/info_panel.dart';
import 'package:flutter/material.dart';

class DetailHome extends StatelessWidget {
  const DetailHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoPanel(
              title: "節約合計金額",
              icon: Icons.savings_outlined,
              text: "400,000",
              unit: "円",
            ),
            InfoPanel(
              title: "残り",
              icon: Icons.rocket_launch_outlined,
              text: "20,000",
              unit: "円",
            ),
            InfoPanel(
              title: "期日",
              icon: Icons.calendar_month_outlined,
              text: "2023年10月21日",
              unit: "",
            ),
          ],
        ),
      ),
    );
  }
}
