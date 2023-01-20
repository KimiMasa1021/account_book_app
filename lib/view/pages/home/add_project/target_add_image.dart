import 'package:account_book_app/utility/hex_color.dart';
import 'package:account_book_app/view/component/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../model/enums.dart';
import '../../../../provider/route/routes.dart';
import '../../../../view_model/target_init_controller.dart';
import '../../../component/dialog/picture_dialog.dart';

class TargetAddImage extends HookConsumerWidget {
  const TargetAddImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final targetInit = ref.watch(targetInitControllerProvider(null));
    final targetInitCTL =
        ref.watch(targetInitControllerProvider(null).notifier);
    final flg = useState(TargetInitFlg.inputing);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "画像設定",
              // style: theme.textTheme.fs19,
            ),
            titleTextStyle: const TextStyle(
              color: Colors.black,
            ),
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: HexColor("#70D4F7"),
            actions: [
              IconButton(
                onPressed: () async {
                  flg.value = TargetInitFlg.creating;
                  await targetInitCTL.createNewTarget();
                  await Future.delayed(const Duration(seconds: 3));
                  flg.value = TargetInitFlg.complete;
                },
                padding: const EdgeInsets.only(right: 10),
                icon: Text(
                  "作成",
                  // style: theme.textTheme.fs16.copyWith(
                  //   color: Colors.black,
                  // ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("#70D4F7"),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 25,
                left: size.width / 2 - 75,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: targetInit.file != null
                              ? DecorationImage(
                                  image: FileImage(targetInit.file!),
                                  fit: BoxFit.fill,
                                )
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 0),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: targetInit.file == null
                            ? FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  targetInit.targetController!.text
                                      .substring(0, 3),
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
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
                            color: Colors.white,
                            border: Border.all(),
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
              ),
            ],
          ),
        ),
        LottieLoading(
          flg: flg.value,
          loadingPath: 'assets/json/cat_loading.json',
          loadingText: '作成中...',
          resultPath: 'assets/json/complete.json',
          resultText: '作成できました',
          resultFunction: () {
            context.go(Routes.path().root);
          },
        )
      ],
    );
  }
}
