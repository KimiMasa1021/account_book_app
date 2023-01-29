import 'package:account_book_app/utility/hex_color.dart';
import 'package:account_book_app/view/component/lottie_loading.dart';
import 'package:account_book_app/view/component/my_lottie_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/enums.dart';
import '../../../provider/route/routes.dart';
import '../../../view_model/target_init_controller.dart';
import '../../component/picture_dialog.dart';

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
            title: const Text("画像設定"),
            actions: [
              IconButton(
                onPressed: () async {
                  flg.value = TargetInitFlg.creating;
                  await targetInitCTL.createNewTarget();
                  await Future.delayed(const Duration(seconds: 3));
                  flg.value = TargetInitFlg.complete;
                },
                padding: const EdgeInsets.only(right: 10),
                icon: const Text("作成"),
              ),
            ],
          ),
          body: Stack(
            children: [
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
                          color: Theme.of(context).cardColor,
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
                      right: -5,
                      top: -5,
                      child: InkWell(
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
                            color: Theme.of(context).backgroundColor,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onBackground,
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              color: Theme.of(context).colorScheme.onBackground,
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
          lottieData: MyLottieData.addProject(),
          resultFunction: () {
            context.go(Routes.path().root);
          },
        )
      ],
    );
  }
}
