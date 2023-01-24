import 'package:account_book_app/view/pages/detail/add_saving/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../../view_model/tags_controller.dart';
import 'widgets/calculator_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SavingAdd extends HookConsumerWidget {
  const SavingAdd({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final priceController = useTextEditingController(text: "");
    final ValueNotifier<int?> tagValue = useState(null);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text("追加"),
        // titleTextStyle: theme.textTheme.fs19.copyWith(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 231, 255),
              ),
              child: FutureBuilder<void>(
                future: tagsCTL.getTags(),
                builder: (context, snapshot) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          tags.length,
                          (index) => Tag(
                            tagValue: tagValue,
                            tag: tags[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: priceController,
                          autofocus: true,
                          keyboardType: TextInputType.none,
                          // style: theme.textTheme.fs33,
                          cursorWidth: 0,
                          decoration: const InputDecoration(
                            hintText: "金額を入力",
                            // hintStyle: theme.textTheme.fs33,
                            contentPadding: EdgeInsets.zero,
                            isCollapsed: true,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (savingCTL.checkSavingAdd(
                          priceController,
                          tagValue,
                        )) {
                          await savingCTL.addSaving(
                            docId,
                            tags.singleWhere((e) => e.id == tagValue.value).tag,
                            priceController.text,
                            () {
                              context.pop();
                            },
                          );
                        }
                      },
                      child: Container(
                        width: 90,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "追加する",
                            // style: theme.textTheme.fs16.copyWith(
                            //   color: Colors.white,
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // height: size.height / 2 - 90,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: List.generate(
                      11,
                      (index) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: index != 3 ? 1 : 2,
                          child: CalculatorButton(
                            function: () {
                              savingCTL.calcButtonFunction(
                                index,
                                priceController,
                              );
                            },
                            title: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: index != 3
                                  ? Text(
                                      index >= 4
                                          ? index == 10
                                              ? "0"
                                              : index.toString()
                                          : (index + 1).toString(),
                                      style: const TextStyle(fontSize: 30),
                                    )
                                  : const Icon(
                                      Icons.backspace_outlined,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
