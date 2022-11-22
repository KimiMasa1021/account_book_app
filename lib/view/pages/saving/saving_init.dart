import 'package:account_book_app/component/saving/member_list_tile.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/saving/input_target_field.dart';
import '../../../constant/price_formatter.dart';
import '../../root_page.dart';
import 'saving_member_add.dart';

class SavingInit extends HookConsumerWidget {
  const SavingInit({super.key});
  static String id = "saving_init";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingController = ref.watch(savingControllerProvider.notifier);

    final targetController = useTextEditingController(text: "");
    final targetPriceController = useTextEditingController(text: "");
    final groupNameController = useTextEditingController(text: "");
    final userState = ref.watch(usersControllerProvider);
    final memberLists = ref.watch(memberListProvider);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      margin: const EdgeInsets.only(top: 13),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.grey,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "あなたに合った目標と目標金額\nを決めて貯金をはじめよう!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InputTargetField(
                      title: "目標",
                      hintText: '達成したい目標を入力してね',
                      inputType: TextInputType.name,
                      controller: targetController,
                      boxHeight: 80,
                      lineHeight: 2,
                    ),
                    InputTargetField(
                      title: "目標金額",
                      hintText: '目標金額を入力してね',
                      controller: targetPriceController,
                      inputType: TextInputType.number,
                      formatter: [CustomTextInputFormatter()],
                    ),
                    InputTargetField(
                      title: "グループ名",
                      hintText: '例：家族,カップル(短め推奨)',
                      controller: groupNameController,
                      inputType: TextInputType.text,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "メンバー",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SavingMemberAdd.id);
                              },
                              child: const Text(
                                "追加する",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        MemberListTile(img: userState!.img, name: "あなた"),
                        Column(
                          children: List.generate(
                            memberLists.length,
                            (index) {
                              return MemberListTile(
                                img: memberLists[index].img,
                                name: memberLists[index].name,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            await savingController.initTarget(
                              targetController.text,
                              targetPriceController.text,
                              groupNameController.text,
                              () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RootPage.id, (route) => false);
                              },
                            );
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              color: Colors.white,
                              border: Border.all(width: 3),
                            ),
                            child: const Center(
                              child: Text(
                                "目標設定完了",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
