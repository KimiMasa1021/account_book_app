import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../view_model/users_controller.dart';
import '../../../../theme/app_text_theme.dart';

class QrCode extends ConsumerWidget {
  const QrCode({
    super.key,
    required this.flg,
  });
  final ValueNotifier<bool> flg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final font = ref.watch(myTextTheme);
    final userState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;

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
                    image: userState!.img != ""
                        ? DecorationImage(
                            image: NetworkImage(
                              userState.img,
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
                  userState.name,
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
              data: usersState!.uid.toString(),
              version: QrVersions.auto,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          InkWell(
            onTap: () async {
              flg.value = !flg.value;
            },
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
