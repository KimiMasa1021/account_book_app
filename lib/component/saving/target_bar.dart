import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';
import '../../view/pages/saving/saving_init.dart';

class TargetBar extends HookConsumerWidget {
  const TargetBar({
    super.key,
    required this.selectedSaving,
  });
  final ValueNotifier<int> selectedSaving;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingState = ref.watch(savingControllerProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            savingState.length,
            (index) {
              return InkWell(
                onTap: () {
                  selectedSaving.value = index;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: index == selectedSaving.value
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      savingState[index].groupName,
                      style: TextStyle(
                        color: index == selectedSaving.value
                            ? Colors.white
                            : Colors.black,
                        fontWeight: index == selectedSaving.value
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SavingInit.id);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.group_add_outlined,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
