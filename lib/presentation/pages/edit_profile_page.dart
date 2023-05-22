import 'package:account_book_app/application/providers/edit_profile_provider/provider/edit_profile_provider.dart';
import 'package:account_book_app/presentation/widgets/common/loading.dart';
import 'package:account_book_app/presentation/widgets/common/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../common/theme/app_text_theme.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);
    final controller = useTextEditingController(text: profile.name);
    final editProfile = ref.watch(editProfileProvider(profile));
    final editProfileCTL = ref.watch(editProfileProvider(profile).notifier);
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("プロフィールの編集"),
            actions: [
              IconButton(
                onPressed: () async => await editProfileCTL.editProfile(
                  () => context.pop(),
                ),
                icon: Text(
                  "保存する",
                  style: font.fs16.copyWith(
                    color: editProfile.newName.isNotEmpty
                        ? Theme.of(context).colorScheme.onSurface
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async =>
                        await editProfileCTL.showEditProfileImageSheet(
                      context,
                      () => editProfileCTL.closeSheet(context),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 4,
                          height: size.width / 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: editProfile.newImageFile == null
                                ? DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(profile.img),
                                  )
                                : DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(editProfile.newImageFile!),
                                  ),
                          ),
                        ),
                        editProfile.newImageFile == null
                            ? Container(
                                width: size.width / 4,
                                height: size.width / 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(0.3),
                                ),
                                child: Icon(Icons.edit,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  NormalTextField(
                    topTitle: "ニックネーム",
                    hintText: "ニックネーム",
                    inputType: TextInputType.text,
                    controller: controller,
                    editable: true,
                    onChanged: (val) => editProfileCTL.onChanged(val),
                  )
                ],
              ),
            ),
          ),
        ),
        Loading(flg: editProfile.isLoading)
      ],
    );
  }
}
