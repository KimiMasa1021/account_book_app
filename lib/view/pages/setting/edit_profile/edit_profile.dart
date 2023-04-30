import 'dart:io';
import 'package:account_book_app/view/component/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/enums.dart';
import '../../../../provider/route/routes.dart';
import '../../../../view_model/users_controller.dart';
import '../../../component/my_lottie_data.dart';
import '../../../../presentation/widgets/common/normal_text_field.dart';

class EditProfile extends HookConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;
    final controller = useTextEditingController(text: userState!.name);
    final ValueNotifier<File?> imageFile = useState(null);
    final userCTL = ref.watch(usersControllerProvider.notifier);
    final flg = useState(TargetInitFlg.inputing);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("アカウントの管理"),
            actions: [
              IconButton(
                onPressed: () async {
                  await userCTL.editProfile(
                    imageFile.value,
                    controller.text,
                    imageFile,
                    userState.name,
                    controller,
                    flg,
                  );
                },
                icon: const Text("保存"),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                        ),
                        Positioned(
                          right: -10,
                          top: -10,
                          child: GestureDetector(
                            onTap: () async {
                              await userCTL.pickEditImage(context, imageFile);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                border: Border.all(
                                  width: 3,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
  }
}
