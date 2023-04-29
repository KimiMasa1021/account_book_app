import 'package:account_book_app/application/providers/go_router_provider/routes/routes.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/profile.dart';

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier({required this.ref, required ProfileService profileService})
      : _profileService = profileService,
        super(Profile());

  final Ref ref;
  final ProfileService _profileService;

  String? get abc => _profileService.userId;

  void init() {
    _profileService.subscribeUserProfile(fetchProfile);
  }

  void fetchProfile(Profile profile) {
    state = profile;
  }

  void branchScreen(BuildContext context) {
    if (state.tags.isEmpty) {
      context.go(Routes.initTags);
    } else {
      context.go(Routes.test1);
    }
  }
}
