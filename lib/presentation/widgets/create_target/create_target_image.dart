import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view/theme/app_text_theme.dart';

class CreateTargetImage extends HookConsumerWidget {
  const CreateTargetImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final font = ref.watch(myTextTheme);
    return SizedBox();

    // return Stack(
    //   children: [
    //     Positioned(
    //       top: 25,
    //       left: size.width / 2 - 75,
    //       child: Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           Center(
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 7, right: 5),
    //               child: CircleAvatar(
    //                 backgroundColor: Theme.of(context).colorScheme.surface,
    //                 radius: (size.width / 3) / 2,
    //                 // foregroundImage: targetInit.file != null
    //                 //     ? FileImage(targetInit.file!)
    //                 //     : null,
    //                 child: Text(
    //                   // targetInit.targetController!.text.substring(0, 2),
    //                   "abc",
    //                   style: font.fs27.copyWith(
    //                     fontWeight: FontWeight.bold,
    //                     color: Theme.of(context).colorScheme.onSurface,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             right: -5,
    //             top: -5,
    //             child: InkWell(
    //               onTap: () async {
    //                 // showDialog(
    //                 //   context: context,
    //                 //   builder: (context) => PictureDialog(
    //                 //     cameraFunction: () async {
    //                 //       await targetInitCTL
    //                 //           .getImage(ImageSource.camera);
    //                 //     },
    //                 //     galleryFunction: () async {
    //                 //       await targetInitCTL
    //                 //           .getImage(ImageSource.gallery);
    //                 //     },
    //                 //     deleteFunction: () {
    //                 //       targetInitCTL.removeImage();
    //                 //     },
    //                 //   ),
    //                 // );
    //               },
    //               child: Container(
    //                 width: 40,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                   color: Theme.of(context).colorScheme.background,
    //                   border: Border.all(
    //                     color: Theme.of(context).colorScheme.onBackground,
    //                     width: 3,
    //                   ),
    //                   shape: BoxShape.circle,
    //                 ),
    //                 child: Center(
    //                   child: Icon(
    //                     Icons.edit,
    //                     color: Theme.of(context).colorScheme.onBackground,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
