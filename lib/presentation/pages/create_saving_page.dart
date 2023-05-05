import 'package:account_book_app/application/providers/create_saving_provider/provider/create_saving_provider.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/presentation/widgets/common/loading.dart';
import 'package:account_book_app/presentation/widgets/create_saving/custom_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/providers/target_provider/state/target_state.dart';
import '../../common/price_formatter.dart';
import '../../view/theme/app_text_theme.dart';
import '../widgets/create_saving/tag.dart';

class CreateSavingPage extends HookConsumerWidget {
  const CreateSavingPage({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final controller = useTextEditingController();
    final profile = ref.watch(profileNotifierProvider);
    final createSaving = ref.watch(createSavingNotifierProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                ),
              )
            ],
            title: const Text("追加"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          profile.tags.length,
                          (index) => Tag(
                            tag: profile.tags[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: controller,
                              autofocus: true,
                              keyboardType: TextInputType.none,
                              style: font.fs27,
                              cursorWidth: 0,
                              inputFormatters: [CustomTextInputFormatter()],
                              decoration: const InputDecoration(
                                hintText: "金額を入力",
                                contentPadding: EdgeInsets.zero,
                                isCollapsed: true,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              // onChanged: (val) {
                              //   debugPrint(val);
                              // },
                              // onEditingComplete: () {
                              //   debugPrint("aaa");
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomKeyboard(
                    controller: controller,
                  ),
                ],
              )
            ],
          ),
        ),
        Loading(flg: createSaving.isLoading)
      ],
    );
  }
}
