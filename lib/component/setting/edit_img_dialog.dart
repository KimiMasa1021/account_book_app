import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/general_provider.dart';

class EditImageDialog extends HookConsumerWidget {
  const EditImageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final userController = ref.watch(usersControllerProvider.notifier);

    final ValueNotifier<File?> previewImage = useState(null);
    final size = MediaQuery.of(context).size;

    final loading = useState(false);
    return Stack(
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: size.height / 2,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "プロフィール画像の変更",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  userController.getImage(
                                    previewImage,
                                    ImageSource.gallery,
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "本体から",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  userController.getImage(
                                    previewImage,
                                    ImageSource.camera,
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "カメラから",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        previewImage.value != null
                            ? InkWell(
                                onTap: () async {
                                  if (!loading.value) {
                                    loading.value = true;
                                    await userController.updateImage(
                                      previewImage.value!,
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                    loading.value = false;
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: loading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Center(
                                            child: Text(
                                              "変更する",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: -60,
                  left: (size.width - 40) / 4,
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: previewImage.value != null
                        ? Image.file(
                            previewImage.value!,
                            fit: BoxFit.fill,
                          )
                        : userState?.img != ""
                            ? Image.network(userState!.img)
                            : Image.asset("assets/img/profile.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
