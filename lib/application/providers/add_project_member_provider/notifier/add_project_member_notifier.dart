import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProjectMemberNotifier extends StateNotifier<List<Profile>> {
  AddProjectMemberNotifier(
    this.ref, {
    required TargetService targetService,
  })  : _targetService = targetService,
        super([]);
  final Ref ref;
  final TargetService _targetService;

  void setMember(Profile profile) {
    if (!state.contains(profile)) {
      state = [...state, profile];
    } else {
      final List<Profile> newAddList = List.from(state);
      newAddList.remove(profile);
      state = newAddList;
    }
  }

  Future<void> addMember(TargetState targetState, Function() navList) async {
    if (state.isEmpty) return;
    final myUid = ref.read(profileNotifierProvider).uid;
    final uidList = state.map((e) => e.uid).toList();
    uidList.add(myUid);
    await _targetService.editProjectMember(targetState.productId, uidList);
    navList();
  }
}
