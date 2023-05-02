import 'package:account_book_app/presentation/widgets/create_target/picture_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../application/providers/create_target_provider/provider/create_target_provider.dart';

class CreateTargetImage extends ConsumerWidget {
  const CreateTargetImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return PictureDialog(
                      galleryFunction: () async =>
                          await createTargetCTL.getImage(ImageSource.gallery),
                      cameraFunction: () async =>
                          await createTargetCTL.getImage(ImageSource.camera),
                      deleteFunction: () async {},
                    );
                  },
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: size.width / 3,
                    height: size.width / 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                      image: createTarget.file != null
                          ? DecorationImage(
                              image: FileImage(createTarget.file!),
                            )
                          : null,
                    ),
                    child: createTarget.file == null
                        ? FittedBox(
                            child: Text(
                              createTarget.target.value.isNotEmpty
                                  ? createTarget.target.value.substring(0, 1)
                                  : "",
                            ),
                          )
                        : null,
                  ),
                  Positioned(
                    right: -10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
