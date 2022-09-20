import 'package:account_book_app/view/routes/app_route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/account/account_appbar.dart';
import '../../../component/account/account_pie_chart.dart';
import '../../../component/account/expend_bar.dart';
import '../../../component/account/expend_child_bar.dart';
import '../../../component/account/income_expend_swicher.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const AccountAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const IncomeExpendSwicher(),
                        const SizedBox(height: 10),
                        const AccountPieChart(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: const [
                              Divider(
                                height: 3,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 20),
                              ExpendBar(),
                              ExpendChildBar(),
                              ExpendChildBar(),
                              ExpendChildBar(),
                              ExpendChildBar(),
                              ExpendChildBar(),
                              ExpendChildBar(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            bottom: 15,
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).push(const AccountAdd());
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlueAccent,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
