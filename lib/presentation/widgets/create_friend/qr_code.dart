import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../application/providers/create_friend_provider/provider/create_friend_provider.dart';
import '../../../common/theme/app_text_theme.dart';

class QrCode extends ConsumerWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final profile = ref.watch(profileNotifierProvider);
    final createFriendCTL = ref.watch(createFriendProvider.notifier);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10),
                    image: profile.img != ""
                        ? DecorationImage(
                            image: NetworkImage(
                              profile.img,
                            ),
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
                Text(
                  profile.name,
                  style: font.fs16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Center(
            child: QrImage(
              size: MediaQuery.of(context).size.width / 2,
              data: profile.uid.toString(),
              version: QrVersions.auto,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          InkWell(
            onTap: () => createFriendCTL.changePage(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    Text(
                      "QRスキャン",
                      style: font.fs16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
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
