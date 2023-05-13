import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/go_router_provider/routes/routes.dart';
import '../../../application/providers/target_provider/state/target_state.dart';
import '../../../common/theme/app_text_theme.dart';

class DetailHeader extends ConsumerWidget {
  const DetailHeader({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);
    final tabHeight = size.height / 3;

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Container(
                height: tabHeight,
                width: size.width,
                decoration: BoxDecoration(
                  image: target.imageUrl != ""
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(target.imageUrl),
                        )
                      : null,
                ),
              ),
              Positioned(
                bottom: 15,
                child: InkWell(
                  onTap: () {
                    context.push(
                      "${Routes.list}/${Routes.projectDetail}/${Routes.createSaving}",
                      extra: target,
                    );
                  },
                  child: Container(
                    width: size.width - 30,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Text(
                        "節約記録を追加！",
                        style: font.fs16.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
