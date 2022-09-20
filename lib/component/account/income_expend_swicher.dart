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
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: iESwicherState ? 5 : -5,
                lightSource: LightSource.topRight,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: Container(
                width: size.width * 0.25,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    "支出",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: iESwicherState ? -5 : 5,
                lightSource: LightSource.topLeft,
                color: Colors.grey,
              ),
              child: Container(
                width: size.width * 0.25,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    "収入",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
