import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/users_controller.dart';
import '../../../component/textfield/normal_text_field.dart';

class AccountManagement extends HookConsumerWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;
    final controller = useTextEditingController(text: userState!.name);
    final ValueNotifier<File?> imageFile = useState(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text("アカウントの管理"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("保存"),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: size.width / 4,
                    height: size.width / 4,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      image: imageFile.value != null
                          ? DecorationImage(
                              image: FileImage(imageFile.value!.absolute),
                              fit: BoxFit.fill,
                            )
                          : userState.img != ""
                              ? DecorationImage(
                                  image: NetworkImage(userState.img),
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
                    // child: target.img == "" && targetInit.file == null
                    //     ? FittedBox(
                    //         fit: BoxFit.fitWidth,
                    //         child: Text(
                    //           target.target.substring(0, 3),
                    //         ),
                    //       )
                    //     : const SizedBox(),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: GestureDetector(
                      onTap: () async {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => PictureDialog(
                        //     cameraFunction: () async {
                        //       await targetInitCTL.getImage(ImageSource.camera);
                        //     },
                        //     galleryFunction: () async {
                        //       await targetInitCTL.getImage(ImageSource.gallery);
                        //     },
                        //     deleteFunction: () {
                        //       targetInitCTL.removeImage();
                        //     },
                        //   ),
                        // );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
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
              NormalTextField(
                topTitle: "名前",
                bottomTitle: "",
                hintText: userState.name,
                inputType: TextInputType.text,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
