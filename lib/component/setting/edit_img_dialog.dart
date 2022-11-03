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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(left: 10, top: 45 + 20, right: 10, bottom: 20),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "プロフィール画像の変更",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
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
                              userController.getImageFromGarary(previewImage);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  "本体から",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              userController.getImageFromCamera(previewImage);
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
                              child: Center(
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
                    SizedBox(height: 10),
                    previewImage.value != null
                        ? InkWell(
                            onTap: () {
                              userController.getImageFromGarary(previewImage);
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "変更する",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: -20,
            child: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: previewImage.value != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(previewImage.value!),
                      )
                    : userState?.img != ""
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(userState!.img),
                          )
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/profile.png"),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
