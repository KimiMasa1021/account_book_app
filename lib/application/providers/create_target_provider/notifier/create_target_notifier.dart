import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateTargetNotifier extends StateNotifier<CreateTargetState> {
  CreateTargetNotifier({
    required this.service,
  }) : super(CreateTargetState.initial());

  final ProfileService service;

  void onStepContinue() {
    int x = state.stepperIndex;
    if (x >= 0 && x < 2) {
      state = state.copyWith(stepperIndex: x += 1);
    }
  }

  void onStepCancel() {
    int x = state.stepperIndex;
    if (x > 0) {
      state = state.copyWith(stepperIndex: x -= 1);
    }
  }
}
