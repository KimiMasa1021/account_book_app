import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class IncomeExpendSwicher extends HookConsumerWidget {
  const IncomeExpendSwicher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider); //値の参照
    final iESwicherController =
        ref.watch(incomeExpendSwicherProvider.notifier); //　変更と関数の実行
    final size = MediaQuery.of(context).size;

    const focusDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    final unFocusDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      border: Border.all(width: 2, color: Colors.blueAccent),
    );
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              iESwicherController.state = !iESwicherState;
            },
            child: Container(
              width: !iESwicherState ? size.width * 0.4 : size.width * 0.25,
              height: 40,
              decoration: !iESwicherState ? focusDecoration : unFocusDecoration,
              child: Center(
                child: Text(
                  "収入",
                  style: TextStyle(
                    fontSize: 20,
                    color: !iESwicherState ? Colors.white : Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              iESwicherController.state = !iESwicherState;
            },
            child: Container(
              width: iESwicherState ? size.width * 0.4 : size.width * 0.25,
              height: 40,
              decoration: iESwicherState ? focusDecoration : unFocusDecoration,
              child: Center(
                child: Text(
                  "支出",
                  style: TextStyle(
                    fontSize: 20,
                    color: iESwicherState ? Colors.white : Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
