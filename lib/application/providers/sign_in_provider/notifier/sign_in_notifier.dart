import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../state/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required this.service,
  }) : super(const SignInState());

  final ProfileService service;

  Future<void> signInWithGoogle(Function() branchFnc) async {
    state = state.copyWith(signInFlg: true);

    final result = await service.signInWithGoogle();

    if (!result.isError) {
      await service.saveUserData(result.asValue!.value);
    }
    state = state.copyWith(signInFlg: false);
    branchFnc();
  }
}
