import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../state/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier(
    this.ref, {
    required this.profileService,
  }) : super(const SignInState());

  final ProfileService profileService;
  final Ref ref;

  Future<void> signInWithGoogle(Function() branchFnc) async {
    state = state.copyWith(signInFlg: true);

    final result = await profileService.signInWithGoogle();

    if (!result.isError) {
      await profileService.saveUserData(result.asValue!.value);
    }
    ref.read(profileNotifierProvider.notifier).init();
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(signInFlg: false);
    branchFnc();
  }
}
