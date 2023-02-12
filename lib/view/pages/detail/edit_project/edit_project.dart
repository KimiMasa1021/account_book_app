import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/component/lottie_loading.dart';
import 'package:account_book_app/view/component/my_lottie_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../model/enums.dart';
import '../../../../utility/price_formatter.dart';
import '../../../../view_model/target_controller.dart';
import '../../../../view_model/target_init_controller.dart';
import '../../../component/picture_dialog.dart';
import '../../../component/large_text_field.dart';
import '../../../component/normal_text_field.dart';
import '../../../theme/app_text_theme.dart';

class EditProject extends HookConsumerWidget {
  const EditProject({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final target = ref.watch(targetControllerProvider);
    final font = ref.watch(myTextTheme);

    return target.when(
      data: (data) {
        final target = data.singleWhere((e) => e.docId == docId);
        final targetInit = ref.watch(targetInitControllerProvider(target));
        final targetInitCTL =
            ref.watch(targetInitControllerProvider(target).notifier);
        final flg = useState(TargetInitFlg.inputing);

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text(
                  "プロジェクトの編集",
                ),
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      if (targetInitCTL.checkDetails()) {
                        primaryFocus?.unfocus();
                        flg.value = TargetInitFlg.creating;
                        await targetInitCTL.updateTarget(target, docId);
                        await Future.delayed(const Duration(seconds: 2));
                        flg.value = TargetInitFlg.complete;
                      }
                    },
                    padding: const EdgeInsets.only(right: 10),
                    icon: const Text("編集"),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7, right: 5),
                              child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                radius: (size.width / 3) / 2,
                                foregroundImage: targetInit.file != null
                                    ? FileImage(targetInit.file!)
                                    : target.img != ""
                                        ? NetworkImage(target.img)
                                            as ImageProvider
                                        : null,
                                child: Text(
                                  target.target.substring(0, 2),
                                  style: font.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: GestureDetector(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) => PictureDialog(
                                      cameraFunction: () async {
                                        await targetInitCTL
                                            .getImage(ImageSource.camera);
                                      },
                                      galleryFunction: () async {
                                        await targetInitCTL
                                            .getImage(ImageSource.gallery);
                                      },
                                      deleteFunction: () {
                                        targetInitCTL.removeImage();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        NormalTextField(
                          topTitle: "目標",
                          bottomTitle: "",
                          hintText: "達成したい目標を入力してね",
                          inputType: TextInputType.text,
                          controller: targetInit.targetController!,
                          editable: true,
                        ),
                        NormalTextField(
                          topTitle: "目標金額",
                          bottomTitle: "",
                          hintText: "目標金額",
                          inputType: TextInputType.number,
                          controller: targetInit.targetPriceController!,
                          formatter: [
                            CustomTextInputFormatter(),
                          ],
                          editable: true,
                        ),
                        LargeTextField(
                          topTitle: "詳細",
                          bottomTitle: "",
                          hintText: "簡単な説明を入力してね",
                          inputType: TextInputType.text,
                          controller: targetInit.targetDescriptionController!,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "達成予定年月日",
                              style: font.fs16.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                primaryFocus?.unfocus();
                                await targetInitCTL.pickTargetDate(context);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      targetInit.targetDateController == null
                                          ? "タップで選択"
                                          : DateFormat('yyyy年MM月dd日').format(
                                              targetInit.targetDateController!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            LottieLoading(
              flg: flg.value,
              lottieData: MyLottieData.editProject(),
              resultFunction: () {
                context.go(Routes.path().root);
              },
            )
          ],
        );
      },
      error: (e, s) {
        return const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}
