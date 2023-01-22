import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/component/dialog/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../model/target/target_state.dart';
import '../../../../../view_model/saving_controller.dart';
import '../../../../component/panel/drawer_info_panel.dart';
import '../../../../component/panel/drawer_action_panel.dart';

class MyDrawer extends HookConsumerWidget {
  const MyDrawer({super.key, required this.target});
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final saving = ref.watch(savingControllerProvider);

    final priceList = saving
        .where((e) => e.productId == target.docId)
        .map((e) => e.price)
        .toList();
    int sum;
    if (priceList.isEmpty) {
      sum = 0;
    } else {
      sum = priceList.reduce((a, b) => a + b);
    }
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Container(
          width: size.width * 0.9,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.only(right: 7, bottom: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: BoxShape.circle,
                      image: target.img != ""
                          ? DecorationImage(
                              image: NetworkImage(
                                target.img,
                              ),
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: target.img == ""
                        ? FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              target.target.substring(0, 3),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${target.target} ",
                          // style: theme.textTheme.fs19.copyWith(
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                        Text(
                          target.targetDescription,
                          // style: theme.textTheme.fs16,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              DrawerInfoPanel(
                title: "目標金額",
                content: savingCTL.formatYen(target.targetPrice),
                icon: Icons.crisis_alert_sharp,
              ),
              DrawerInfoPanel(
                title: "達成金額",
                content: savingCTL.formatYen(sum),
                icon: Icons.stars,
              ),
              DrawerInfoPanel(
                title: '達成予定日',
                content: DateFormat('yyyy年MM月dd日').format(target.targetDate),
                icon: Icons.calendar_today,
              ),
              const SizedBox(height: 30),
              DrawerActionPanel(
                title: "プロジェクトの編集",
                icon: Icons.settings,
                function: () {
                  context.pushNamed(
                    Routes.name().editProject,
                    params: {'targetId': target.docId},
                  );
                },
              ),
              DrawerActionPanel(
                title: "メンバー",
                icon: Icons.people_alt_outlined,
                function: () {
                  context.pushNamed(
                    Routes.name().memberList,
                    extra: target,
                  );
                },
              ),
              DrawerActionPanel(
                title: "招待",
                icon: Icons.person_add_sharp,
                function: () {
                  context.pushNamed(
                    Routes.name().inviteMember,
                    params: {'targetId': target.docId},
                  );
                },
              ),
              DrawerActionPanel(
                title: "退会",
                icon: Icons.logout,
                function: () {
                  showDialog(
                    context: context,
                    builder: (context) => WarningDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
