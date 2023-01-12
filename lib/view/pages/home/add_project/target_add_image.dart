import 'package:account_book_app/constant/hex_color.dart';
import 'package:account_book_app/provider/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../../component/init/picture_dialog.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

enum TargetInitFlg {
  inputing,
  creating,
  complete,
}

class TargetAddImage extends HookConsumerWidget {
  const TargetAddImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final size = MediaQuery.of(context).size;

    final targetInit = ref.watch(targetInitControllerProvider);
    final targetInitCTL = ref.watch(targetInitControllerProvider.notifier);
    final flg = useState(TargetInitFlg.inputing);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "画像設定",
              style: theme.textTheme.fs19,
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
            backgroundColor: HexColor("#FFF8DC"),
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
                  style: theme.textTheme.fs16.copyWith(
                    color: Colors.black,
                  ),
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
                      color: HexColor("#FFF8DC"),
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
                top: 40,
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
        flg.value == TargetInitFlg.creating ||
                flg.value == TargetInitFlg.complete
            ? Material(
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: flg.value == TargetInitFlg.creating
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/json/cat_loading.json',
                                  width: 230,
                                  height: 230,
                                  frameRate: FrameRate(60),
                                  repeat: true,
                                ),
                                Text(
                                  "creating...",
                                  style: theme.textTheme.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/json/complete.json',
                                  width: 230,
                                  height: 230,
                                  frameRate: FrameRate(60),
                                  repeat: false,
                                ),
                                Text(
                                  "完了しました",
                                  style: theme.textTheme.fs19.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    flg.value == TargetInitFlg.complete
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: InkWell(
                                onTap: () {
                                  context.go(Routes.path().root);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: HexColor("#296BFF"),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "ホームに戻る",
                                      style: theme.textTheme.fs19.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
