import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/pages/detail/add_saving/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/target/target_state.dart';
import '../../../../view_model/tags_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'widgets/calculator_button.dart';

class AddSaving extends HookConsumerWidget {
  const AddSaving({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final priceCTL = useTextEditingController(text: "");
    final ValueNotifier<int?> tagValue = useState(null);
    final font = ref.watch(myTextTheme);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.name().addTag);
            },
            icon: const Icon(
              Icons.bookmark_add_outlined,
            ),
          )
        ],
        title: const Text("追加"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: FutureBuilder<void>(
                future: tagsCTL.getTags(),
                builder: (context, snapshot) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: priceCTL,
                          autofocus: true,
                          keyboardType: TextInputType.none,
                          style: font.fs27,
                          cursorWidth: 0,
                          decoration: const InputDecoration(
                            hintText: "金額を入力",
                            contentPadding: EdgeInsets.zero,
                            isCollapsed: true,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 1,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 4,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 7,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 2,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 5,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 8,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 3,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 6,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 9,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CalculatorButton(
                            aspectRatio: 1 / 2,
                            keyType: KeyType.backSpeace,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                          CalculatorButton(
                            aspectRatio: 1,
                            value: 0,
                            keyType: KeyType.number,
                            priceCTL: priceCTL,
                            target: target,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CalculatorButton(
                        aspectRatio: 1 / 3,
                        keyType: KeyType.enter,
                        priceCTL: priceCTL,
                        tagValue: tagValue,
                        target: target,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
        // flg.value
        //     ? Material(
        //         child: Container(
        //           width: size.width,
        //           height: size.height,
        //           decoration: const BoxDecoration(),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Lottie.asset(
        //                 LottieUrl.catLoading.url,
        //                 width: 230,
        //                 height: 230,
        //                 frameRate: FrameRate(60),
        //                 repeat: true,
        //               ),
        //               Text(
        //                 "節約記録追加中...",
        //                 style: font.fs19.copyWith(
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       )
        //     : const SizedBox()



                      // Padding(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 10,
                //   vertical: 10,
                // ),
              //   child: StaggeredGrid.count(
              //     crossAxisCount: 5,
              //     mainAxisSpacing: 4,
              //     crossAxisSpacing: 4,
              //     children: List.generate(
              //       12,
              //       (index) {
              //         return StaggeredGridTile.count(
              //           crossAxisCellCount: 1,
              //           mainAxisCellCount: index == 4
              //               ? 3
              //               : index == 3
              //                   ? 2
              //                   : 1,
              //           child: CalculatorButton(
              //             index: index,
              //             onTap: () {
              //               savingCTL.calcButtonFunction(
              //                 index,
              //                 priceController,
              //               );
              //             },
              //             enterFucntion: () async {
              //               if (index != 4) return;
              //               if (savingCTL.checkSavingAdd(
              //                 priceController,
              //                 tagValue,
              //               )) {
              //                 await savingCTL.addSaving(
              //                   priceController,
              //                   tagValue,
              //                   target,
              //                   saving,
              //                   tags,
              //                   flg,
              //                   () => context.pop(),
              //                 );
              //               }
              //             },
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // )