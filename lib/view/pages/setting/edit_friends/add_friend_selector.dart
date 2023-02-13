import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/shadow_button.dart';
import '../../../../provider/route/routes.dart';
import '../../../theme/app_text_theme.dart';

class FriendsAddDescription extends ConsumerWidget {
  const FriendsAddDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンド追加"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.pushNamed(Routes.name().friendSearch);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_search_outlined,
                            size: 33,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "IDを使ってフレンド検索",
                            style: font.fs19.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.name().scanQr);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Icon(
                      Icons.qr_code,
                      size: 30,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "QRコードで追加",
                      style: font.fs16.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.onBackground,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
