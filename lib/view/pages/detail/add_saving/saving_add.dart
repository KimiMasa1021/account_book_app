import 'package:account_book_app/view/pages/detail/add_saving/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../../model/target/target_state.dart';
import '../../../../utility/assets_url.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../../view_model/tags_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'widgets/calculator_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SavingAdd extends HookConsumerWidget {
  const SavingAdd({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final priceController = useTextEditingController(text: "");
    final ValueNotifier<int?> tagValue = useState(null);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final saving = ref.watch(savingControllerProvider);
    final font = ref.watch(myTextTheme);
    final flg = useState(false);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
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
                              controller: priceController,
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
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: StaggeredGrid.count(
                        crossAxisCount: 5,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: List.generate(
                          12,
                          (index) {
                            return StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: index == 4
                                  ? 3
                                  : index == 3
                                      ? 2
                                      : 1,
                              child: CalculatorButton(
                                index: index,
                                onTap: () {
                                  savingCTL.calcButtonFunction(
                                    index,
                                    priceController,
                                  );
                                },
                                enterFucntion: () async {
                                  if (index != 4) return;
                                  if (savingCTL.checkSavingAdd(
                                    priceController,
                                    tagValue,
                                  )) {
                                    await savingCTL.addSaving(
                                      priceController,
                                      tagValue,
                                      target,
                                      saving,
                                      tags,
                                      flg,
                                      () => context.pop(),
                                    );
                                  }
                                },
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
        ),
        flg.value
            ? Material(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        LottieUrl.catLoading.url,
                        width: 230,
                        height: 230,
                        frameRate: FrameRate(60),
                        repeat: true,
                      ),
                      Text(
                        "節約記録追加中...",
                        style: font.fs19.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
