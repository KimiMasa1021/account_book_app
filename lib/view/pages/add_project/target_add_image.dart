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
import '../../theme/app_text_theme.dart';

class TargetAddImage extends HookConsumerWidget {
  const TargetAddImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final targetInit = ref.watch(targetInitControllerProvider(null));
    final targetInitCTL =
        ref.watch(targetInitControllerProvider(null).notifier);
    final flg = useState(TargetInitFlg.inputing);
    final font = ref.watch(myTextTheme);

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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, right: 5),
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          radius: (size.width / 3) / 2,
                          foregroundImage: targetInit.file != null
                              ? FileImage(targetInit.file!)
                              : null,
                          child: Text(
                            targetInit.targetController!.text.substring(0, 2),
                            style: font.fs27.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
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
                            color: Theme.of(context).colorScheme.background,
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
