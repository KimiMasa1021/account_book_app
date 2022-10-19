import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/statistics/monthly_appbar.dart';
import '../../../provider/general_provider.dart';

class MonthlyPage extends HookConsumerWidget {
  const MonthlyPage({required this.setDate, super.key});
  final ValueNotifier<DateTime> setDate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(processingPriceProvider(setDate.value)).when(
      data: (state) {
        final expendStateYearly = state.expendStateYearly;
        final incomeStateYearly = state.incomeStateYearly;

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
                        (index) {
                          int sumExpend = expendStateYearly
                                  .where(
                                    (e) => e.registeTime.month == index + 1,
                                  )
                                  .toList()
                                  .isNotEmpty
                              ? expendStateYearly
                                      .where(
                                        (e) => e.registeTime.month == index + 1,
                                      )
                                      .map((a) => a.price)
                                      .toList()
                                      .reduce((v, e) => v + e) *
                                  -1
                              : 0;

                          int sumIncome = incomeStateYearly
                                  .where(
                                    (e) => e.registeTime.month == index + 1,
                                  )
                                  .toList()
                                  .isNotEmpty
                              ? incomeStateYearly
                                  .where(
                                    (e) => e.registeTime.month == index + 1,
                                  )
                                  .map((a) => a.price)
                                  .toList()
                                  .reduce((v, e) => v + e)
                              : 0;

                          return InkWell(
                            onTap: () {
                              setDate.value =
                                  DateTime(setDate.value.year, index + 1);
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
                                  Container(
                                    width: 10,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: DateTime(setDate.value.year,
                                                  index + 1) ==
                                              DateTime(DateTime.now().year,
                                                  DateTime.now().month)
                                          ? const Color.fromARGB(
                                              255, 54, 168, 244)
                                          : null,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
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
                                    children: [
                                      Text(
                                        sumIncome.toString(),
                                        style: const TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        sumExpend.toString(),
                                        style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const SizedBox();
      },
      error: (error, stackTrace) {
        return const SizedBox();
      },
    );
  }
}
