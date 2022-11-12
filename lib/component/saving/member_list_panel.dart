import 'package:account_book_app/view/pages/saving/saving_member_add_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../provider/general_provider.dart';
import '../../repository/friends_repository.dart';

class MemberListPanel extends HookConsumerWidget {
  const MemberListPanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingState = ref.watch(savingControllerProvider);
    final selectedSaving = ref.watch(selectedSavingProvider);

    return FutureBuilder(
      future: ref
          .watch(friendsListRepositoryProvider)
          .feachTargetsFriends(savingState[selectedSaving].members),
      builder: (context, friend) {
        if (!friend.hasData) {
          return const SizedBox();
        } else {
          return Container(
            margin: const EdgeInsets.only(top: 13, left: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "メンバーリスト",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SavingMemberAdd2.id,
                            arguments: friend.data);
                      },
                      child: const Text(
                        "追加",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ...List.generate(
                  friend.data!.length,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: friend.data![index].img != ""
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        friend.data![index].img,
                                      ),
                                    )
                                  : const DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage("assets/img/profile.png"),
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friend.data![index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                friend.data![index].email,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
